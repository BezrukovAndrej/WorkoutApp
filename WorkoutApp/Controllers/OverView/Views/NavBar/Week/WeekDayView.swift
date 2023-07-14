//
//  WeekDayView.swift
//  WorkoutApp
//
//  Created by Andrey Bezrukov on 09.07.2023.
//

import UIKit

final class WeekDayView: UIView {
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.font = Resouces.Fonts.hellvelticaRegular(with: 9)
        label.textAlignment = .center
        return label
    }()
    
    private var dateLabel: UILabel = {
        let label = UILabel()
        label.font = Resouces.Fonts.hellvelticaRegular(with: 15)
        label.textAlignment = .center
        return label
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 3
        stack.axis = .vertical
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with index: Int, and name: String) {
        let startOfWeek = Date().startOfWeek
        let currentDay = startOfWeek.agoForword(to: index)
        let day = Date.calendar.component(.day, from: currentDay)
        
        let isToDay = currentDay.stripTime() == Date().stripTime()
        
        backgroundColor = isToDay ? .active : .background
        
        nameLabel.text = name.uppercased()
        nameLabel.textColor = isToDay ? .white : .inactive
        
        dateLabel.text = "\(day)"
        dateLabel.textColor = isToDay ? .white : .inactive
    }
    
    private func setupViews() {
        layer.cornerRadius = 5
        layer.masksToBounds = true
    }
    
    private func addSubviews() {
        [stackView].forEach {addViewsTAMIC($0)}
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(dateLabel)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
