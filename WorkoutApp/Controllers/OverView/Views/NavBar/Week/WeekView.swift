//
//  WeekView.swift
//  WorkoutApp
//
//  Created by Andrey Bezrukov on 09.07.2023.
//

import UIKit

final class WeekView: UIView {
     
    private let calendar = Date.calendar
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 7
        stack.distribution = .fillEqually
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        var weeksDays = Date.calendar.shortStandaloneWeekdaySymbols
        if Date.calendar.firstWeekday == 2 {
            let sunDay = weeksDays.remove(at: 0)
            weeksDays.append(sunDay)
        }
        
        weeksDays.enumerated().forEach { index, name in
            let view = WeekDayView()
            view.configure(with: index, and: name)
            stackView.addArrangedSubview(view)
        }
    }
    
    private func addSubviews() {
        [stackView].forEach{addViewsTAMIC($0)}
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
