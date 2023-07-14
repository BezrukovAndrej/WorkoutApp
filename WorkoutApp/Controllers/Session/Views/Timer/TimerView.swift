//
//  TimerView.swift
//  WorkoutApp
//
//  Created by Andrey Bezrukov on 10.07.2023.
//

import UIKit

enum TimerState {
    case isRuning
    case isPaused
    case isStopped
}

final class TimerView: UIView {
    
    private let progressView = ProgressView()
    private let completedPercentView = PercentView()
    private let remainingPercentView = PercentView()
    private var timer = Timer()
    private var timerProgress: CGFloat = 0
    private var timerDuration = 0.0
    
    var state: TimerState = .isStopped
    var callBack: (() ->Void)?
    
    private let elapsedTimerLabel: UILabel = {
        let label = UILabel()
        label.text = Resouces.Session.elepsedTime
        label.font = Resouces.Fonts.hellvelticaRegular(with: 14)
        label.textColor = .inactive
        label.textAlignment = .center
        return label
    }()
    
    private let elapsedTimerValueLabel: UILabel = {
        let label = UILabel()
        label.font = Resouces.Fonts.hellvelticaRegular(with: 46)
        label.textColor = .titleGray
        label.textAlignment = .center
        return label
    }()
    
    private let remainingTimerLabel: UILabel = {
        let label = UILabel()
        label.text = Resouces.Session.remainingTime
        label.font = Resouces.Fonts.hellvelticaRegular(with: 13)
        label.textColor = .inactive
        label.textAlignment = .center
        return label
    }()
    
    private let remainingTimerValueLabel: UILabel = {
        let label = UILabel()
        label.font = Resouces.Fonts.hellvelticaRegular(with: 13)
        label.textColor = .titleGray
        label.textAlignment = .center
        return label
    }()
    
    private let timeStackViews: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.spacing = 10
        return view
    }()
    
    private let bottomStackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillProportionally
        view.spacing = 25
        return view
    }()
    
    private let bottomSeperatoView: UIView = {
        let view = UIView()
        view.backgroundColor = .separator
        return view
    }()
    
    func configure(with duration: Double, progress: Double) {
        timerDuration = duration
        
        let tempCurrentValue = progress > duration ? duration : progress
        
        let goalValueDivider = duration == 0 ? 1 : duration
        let precent = tempCurrentValue / goalValueDivider
        let roudedPercent = Int(round(precent * 100))
        
        elapsedTimerValueLabel.text = getDisplayedString(form: Int(tempCurrentValue))
        remainingTimerValueLabel.text = getDisplayedString(form: Int(duration) - Int(tempCurrentValue))
        completedPercentView.configure(with: "COMPLETED", andvalue: roudedPercent)
        remainingPercentView.configure(with: "REMAINING", andvalue: 100 - roudedPercent)
        
        progressView.drawProgress(with: CGFloat(precent))
    }
    
    func startTimer(complition: @escaping () -> Void) {
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01,
                                     repeats: true,
                                     block: { [weak self] timer in
            guard let self = self else { return }
            self.timerProgress += 0.01
            
            if self.timerProgress > self.timerDuration {
                self.timerProgress = self.timerDuration
                timer.invalidate()
                complition()
            }
            
            self.configure(with: self.timerDuration, progress: self.timerProgress)
        })
    }
    
    func pauseTimer() {
        timer.invalidate()
    }
    
    func stopTimer() {
        guard self.timerProgress > 0 else { return }
        timer.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.01,
                                     repeats: true,
                                     block: { [weak self] timer in
            guard let self = self else { return }
            self.timerProgress -= self.timerDuration * 0.02
            
            if self.timerProgress <= 0 {
                self.timerProgress = 0
                timer.invalidate()
            }
            
            self.configure(with: self.timerDuration, progress: self.timerProgress)
        })
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func getDisplayedString(form value: Int) -> String {
        let seconds = value % 60
        let minutes = (value / 60) % 60
        let hours = value / 3600
        
        let secondStr = seconds < 10 ? "0\(seconds)" : "\(seconds)"
        let minutesStr = minutes < 10 ? "0\(minutes)" : "\(minutes)"
        let hoursStr = hours < 10 ? "0\(hours)" : "\(hours)"
        
        return hours == 0
        ? [minutesStr, secondStr].joined(separator: ":")
        : [hoursStr, minutesStr, secondStr].joined(separator: ":")
    }
    
    private func addSubviews() {
        [progressView, timeStackViews, bottomStackView].forEach{addViewsTAMIC($0)}
        
        [elapsedTimerLabel,elapsedTimerValueLabel,
         remainingTimerLabel,remainingTimerValueLabel
        ].forEach {timeStackViews.addArrangedSubview($0)}
        
        [completedPercentView, bottomSeperatoView, remainingPercentView
        ].forEach {bottomStackView.addArrangedSubview($0)}
    }
}

// MARK: - Set Constraints

extension TimerView {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            progressView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor),
            
            timeStackViews.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
            timeStackViews.centerXAnchor.constraint(equalTo: progressView.centerXAnchor),
            
            bottomStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -28),
            bottomStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bottomStackView.heightAnchor.constraint(equalToConstant: 35),
            bottomStackView.widthAnchor.constraint(equalToConstant: 175),
            
            bottomSeperatoView.widthAnchor.constraint(equalToConstant: 1)
        ])
    }
}
