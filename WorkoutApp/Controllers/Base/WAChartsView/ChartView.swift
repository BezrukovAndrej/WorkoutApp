//
//  ChartView.swift
//  WorkoutApp
//
//  Created by Andrey Bezrukov on 13.07.2023.
//

import UIKit

final class ChartView: UIView {
    
    private let yAxisSeperator: UIView = {
        let view = UIView()
        view.backgroundColor = .separator
        return view
    }()
    
    private let xAxisSeperator: UIView = {
        let view = UIView()
        view.backgroundColor = .separator
        return view
    }()
    
    func configure(with date: [WAChartsView.Data], topChartOffset: Int = 10) {
        layoutIfNeeded()
        drawDashLines()
        drawChart(with: date, topChartOffset: topChartOffset)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func drawDashLines(with counts: Int = 9) {
        (0..<counts).map{ CGFloat($0) }.forEach {
            drawDashLine(at: bounds.height * 0.320 * $0)
        }
    }
    
    private func drawDashLine(at yPosition: CGFloat) {
        let startPoint = CGPoint(x: 0, y: yPosition)
        let endPoint = CGPoint(x: 305, y: yPosition)
        
        let dashPath = CGMutablePath()
        dashPath.addLines(between: [startPoint, endPoint])
        
        let dashLayer = CAShapeLayer()
        dashLayer.path = dashPath
        dashLayer.strokeColor = UIColor.separator.cgColor
        dashLayer.lineWidth = 1
        dashLayer.lineDashPattern = [6, 3]
        
        layer.addSublayer(dashLayer)
        
    }
    
    func drawChart(with data: [WAChartsView.Data], topChartOffset: Int ) {
        guard let maxValue = data.sorted(by: { $0.value > $1.value}).first?.value else { return }
        let valuePoints = data.enumerated().map { CGPoint(x: CGFloat($0), y: CGFloat($1.value)) }
        let chartHeight = 230 / CGFloat(maxValue + topChartOffset)
        
        let points = valuePoints.map {
            let x = 300 / CGFloat(valuePoints.count - 1) * $0.x
            let y = 270 - $0.y * chartHeight
            return CGPoint(x: x, y: y)
        }
        
        let chartPath = UIBezierPath()
        chartPath.move(to: points[0])
        
        points.forEach {
            chartPath.addLine(to: $0)
            drawChartDot(at: $0)
        }
        
        let charLayer = CAShapeLayer()
        charLayer.path = chartPath.cgPath
        charLayer.fillColor = UIColor.clear.cgColor
        charLayer.strokeColor = UIColor.active.cgColor
        charLayer.lineWidth = 3
        charLayer.strokeEnd = 1
        charLayer.lineJoin = .round
        
        layer.addSublayer(charLayer)
    }
    
    func drawChartDot(at point: CGPoint) {
        let dotPath = UIBezierPath()
        dotPath.move(to: point)
        dotPath.addLine(to: point)
        
        let dotLayer = CAShapeLayer()
        dotLayer.path = dotPath.cgPath
        dotLayer.strokeColor = UIColor.active.cgColor
        dotLayer.lineCap = .round
        dotLayer.lineWidth = 10
        
        layer.addSublayer(dotLayer)
    }
    
    private func addSubviews() {
        [yAxisSeperator, xAxisSeperator].forEach{addViewsTAMIC($0)}
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            yAxisSeperator.leadingAnchor.constraint(equalTo: leadingAnchor),
            yAxisSeperator.topAnchor.constraint(equalTo: topAnchor),
            yAxisSeperator.bottomAnchor.constraint(equalTo: bottomAnchor),
            yAxisSeperator.widthAnchor.constraint(equalToConstant: 1),
            
            xAxisSeperator.leadingAnchor.constraint(equalTo: leadingAnchor),
            xAxisSeperator.trailingAnchor.constraint(equalTo: trailingAnchor),
            xAxisSeperator.bottomAnchor.constraint(equalTo: bottomAnchor),
            xAxisSeperator.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
