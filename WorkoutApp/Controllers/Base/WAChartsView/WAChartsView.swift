//
//  WAChartsView.swift
//  WorkoutApp
//
//  Created by Andrey Bezrukov on 13.07.2023.
//

import UIKit

extension WAChartsView {
    struct Data {
        let value: Int
        let title: String
    }
}

final class WAChartsView: UIView {
    
    private let yAxisView = YAxisView()
    private let xAxisView = XAxisView()
    private let chartView = ChartView()

    func configure(with data: [WAChartsView.Data], topChartOffset: Int = 10) {
        yAxisView.configure(with: data)
        xAxisView.configure(with: data)
        chartView.configure(with: data, topChartOffset: topChartOffset)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        [yAxisView, xAxisView, chartView].forEach{addViewsTAMIC($0)}
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            yAxisView.leadingAnchor.constraint(equalTo: leadingAnchor),
            yAxisView.topAnchor.constraint(equalTo: topAnchor),
            yAxisView.bottomAnchor.constraint(equalTo: xAxisView.topAnchor, constant: -12),
            
            xAxisView.leadingAnchor.constraint(equalTo: yAxisView.trailingAnchor, constant: 12),
            xAxisView.bottomAnchor.constraint(equalTo: bottomAnchor),
            xAxisView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            chartView.leadingAnchor.constraint(equalTo: yAxisView.trailingAnchor, constant: 12),
            chartView.topAnchor.constraint(equalTo: topAnchor),
            chartView.trailingAnchor.constraint(equalTo: trailingAnchor),
            chartView.bottomAnchor.constraint(equalTo: xAxisView.topAnchor, constant: -12),
        ])
    }
}
