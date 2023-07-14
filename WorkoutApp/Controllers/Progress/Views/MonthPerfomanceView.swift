//
//  MonthPerfomanceView.swift
//  WorkoutApp
//
//  Created by Andrey Bezrukov on 12.07.2023.
//

import UIKit

final class MonthPerfomanceView: WABaseInfoView {
    
    private let chartsView = WAChartsView()
    
    override func addSubviews() {
        super.addSubviews()
        
        addViewsTAMIC(chartsView)
    }
    
    func configure(with items: [WAChartsView.Data], topChartOffset: Int) {
        chartsView.configure(with: items, topChartOffset: topChartOffset)
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        NSLayoutConstraint.activate([
            chartsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            chartsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            chartsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            chartsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
}
