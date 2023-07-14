//
//  TimerPercentView.swift
//  WorkoutApp
//
//  Created by Andrey Bezrukov on 11.07.2023.
//

import UIKit

extension TimerView {
    final class PercentView: UIView {
        
        private let stackView: UIStackView = {
            let view = UIStackView()
            view.axis = .vertical
            view.distribution = .fillProportionally
            view.spacing = 5
            return view
        }()
        
        private let percentLable: UILabel = {
            let label = UILabel()
            label.font = Resouces.Fonts.hellvelticaRegular(with: 23)
            label.textColor = .titleGray
            label.textAlignment = .center
            return label
        }()
        
        private let subtitleLable: UILabel = {
            let label = UILabel()
            label.font = Resouces.Fonts.hellvelticaRegular(with: 10)
            label.textColor = .inactive
            label.textAlignment = .center
            return label
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            addSubviews()
            setConstraints()
            
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func configure(with title: String, andvalue value: Int) {
            subtitleLable.text = title
            percentLable.text = "\(value)%"
        }
        
        private func addSubviews() {
            [stackView].forEach {addViewsTAMIC($0)}
            stackView.addArrangedSubview(percentLable)
            stackView.addArrangedSubview(subtitleLable)
        }
        
        private func setConstraints() {
            
            NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
                stackView.topAnchor.constraint(equalTo: topAnchor),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
                stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        }
    }
}
