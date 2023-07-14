//
//  ProgressView.swift
//  WorkoutApp
//
//  Created by Andrey Bezrukov on 10.07.2023.
//

import UIKit

extension TimerView {
    final class ProgressView: UIView {
        
        func drawProgress(with percent: CGFloat) {
            layer.sublayers?.removeAll()
            
            let cercleFrame = UIScreen.main.bounds.width - (15 + 40) * 2
            let radius = cercleFrame / 2
            let center = CGPoint(x: radius, y: radius)
            let startAngle = -CGFloat.pi * 7 / 6
            let endAngle = CGFloat.pi * 1 / 6
            
            let circlePath = UIBezierPath(arcCenter: center,
                                          radius: radius,
                                          startAngle: startAngle,
                                          endAngle: endAngle,
                                          clockwise: true)
            
            let defaultCircleLayer = CAShapeLayer()
            defaultCircleLayer.path = circlePath.cgPath
            defaultCircleLayer.strokeColor = UIColor.separator.cgColor
            defaultCircleLayer.lineWidth = 20
            defaultCircleLayer.strokeEnd = 1
            defaultCircleLayer.fillColor = UIColor.clear.cgColor
            defaultCircleLayer.lineCap = .round
            
            let circleLayer = CAShapeLayer()
            circleLayer.path = circlePath.cgPath
            circleLayer.strokeColor = UIColor.active.cgColor
            circleLayer.lineWidth = 20
            circleLayer.strokeEnd = percent
            circleLayer.fillColor = UIColor.clear.cgColor
            circleLayer.lineCap = .round
            
            let dotAngle = CGFloat.pi * (7 / 6 - (8 / 6 * percent))
            let dotPoint = CGPoint(x: cos(-dotAngle) * radius + center.x,
                                   y: sin(-dotAngle) * radius + center.y)
            
            let doPath = UIBezierPath()
            doPath.move(to: dotPoint)
            doPath.addLine(to: dotPoint)
            
            let bigDotLayer = CAShapeLayer()
            bigDotLayer.path = doPath.cgPath
            bigDotLayer.fillColor = UIColor.clear.cgColor
            bigDotLayer.strokeColor = UIColor.active.cgColor
            bigDotLayer.lineCap = .round
            bigDotLayer.lineWidth = 20
            
            let dotLayer = CAShapeLayer()
            dotLayer.path = doPath.cgPath
            dotLayer.fillColor = UIColor.clear.cgColor
            dotLayer.strokeColor = UIColor.white.cgColor
            dotLayer.lineCap = .round
            dotLayer.lineWidth = 8
            
            let barsFrame = UIScreen.main.bounds.width - (15 + 40 + 25) * 2
            let barsRadius = barsFrame / 2
            
            let barsPath = UIBezierPath(arcCenter: center,
                                          radius: barsRadius,
                                          startAngle: startAngle,
                                          endAngle: endAngle,
                                          clockwise: true)
            
            let barsLayer = CAShapeLayer()
            barsLayer.path = barsPath.cgPath
            barsLayer.fillColor = UIColor.clear.cgColor
            barsLayer.strokeColor = UIColor.clear.cgColor
            barsLayer.lineWidth = 6
            
            let startBarRadius = barsRadius - barsLayer.lineWidth * 0.5
            let endBarRadius = startBarRadius + 6
            
            var angle: CGFloat = 7 / 6
            (1...9).forEach { _ in
                let barAngle = CGFloat.pi * angle
                let startBarPoint = CGPoint(
                    x: cos(-barAngle) * startBarRadius + center.x,
                    y: sin(-barAngle) * startBarRadius + center.y)
                
                let endBarPoint = CGPoint(
                    x: cos(-barAngle) * endBarRadius + center.x,
                    y: sin(-barAngle) * endBarRadius + center.y)
                
                let barPath = UIBezierPath()
                barPath.move(to: startBarPoint)
                barPath.addLine(to: endBarPoint)
                
                let barLayer = CAShapeLayer()
                barLayer.path = barPath.cgPath
                barLayer.fillColor = UIColor.clear.cgColor
                barLayer.strokeColor = angle >= (7 / 6 - (8 / 6 * percent)) ? UIColor.active.cgColor : UIColor.separator.cgColor
                barLayer.lineCap = .round
                barLayer.lineWidth = 4
                
                barsLayer.addSublayer(barLayer)
                
                angle -= 1 / 6
            }
            
            layer.addSublayer(defaultCircleLayer)
            layer.addSublayer(circleLayer)
            layer.addSublayer(bigDotLayer)
            layer.addSublayer(dotLayer)
            layer.addSublayer(barsLayer)
        }
    }
}
