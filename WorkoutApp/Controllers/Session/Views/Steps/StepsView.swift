//
//  StepsView.swift
//  WorkoutApp
//
//  Created by Andrey Bezrukov on 12.07.2023.
//

import UIKit

final class StepsView: WABaseInfoView {
    
    private let barsView = WABarsView()
    
    override func addSubviews() {
        super.addSubviews()
        
        addViewsTAMIC(barsView)
    }
    
    func configure(with items: [WABarView.Data]) {
        barsView.configure(with: items)
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        NSLayoutConstraint.activate([
            barsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            barsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            barsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            barsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
}
