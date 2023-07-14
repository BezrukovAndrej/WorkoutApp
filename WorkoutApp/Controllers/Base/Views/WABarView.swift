//
//  WABarView.swift
//  WorkoutApp
//
//  Created by Andrey Bezrukov on 12.07.2023.
//

import UIKit

extension WABarView {
    struct Data {
        let value: String
        let heightMultiplier: Double
        let title: String
    }
}

final class WABarView: UIView {
    
    private let  heightMultiplier: Double
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = Resouces.Fonts.hellvelticaRegular(with: 13)
        label.textColor = .active
        return label
    }()
    
    private let barView: UIView = {
        let view = UIView()
        view.backgroundColor = .active
        view.layer.cornerRadius = 2.5
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resouces.Fonts.hellvelticaRegular(with: 9)
        label.textColor = .inactive
        return label
    }()
    
    init(date: Data) {
        self.heightMultiplier = date.heightMultiplier
        super.init(frame: .zero)
        
        valueLabel.text = date.value
        titleLabel.text = date.title.uppercased()
        
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        self.heightMultiplier = 0
        super.init(frame: .zero)
    }

    private func addSubviews() {
        [valueLabel, barView, titleLabel].forEach{addViewsTAMIC($0)}
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            valueLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            valueLabel.heightAnchor.constraint(equalToConstant: 10),
            
            barView.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 5),
            barView.centerXAnchor.constraint(equalTo: centerXAnchor),
            barView.widthAnchor.constraint(equalToConstant: 17),
            barView.heightAnchor.constraint(equalTo: heightAnchor, multiplier:  heightMultiplier * 0.8),
            
            titleLabel.topAnchor.constraint(equalTo: barView.bottomAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
}
