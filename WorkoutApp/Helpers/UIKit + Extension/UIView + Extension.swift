//
//  UIView + Extension.swift
//  WorkoutApp
//
//  Created by Andrey Bezrukov on 26.06.2023.
//

import UIKit

extension UIView {
    
    func addBottomBorder(with color: UIColor, height: CGFloat) {
        let seperator = UIView()
        seperator.backgroundColor = color
        seperator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        seperator.frame = CGRect(x: 0,
                                 y: frame.height - height,
                                 width: frame.width,
                                 height: height)
        addSubview(seperator)
    }
    
    func addViewsTAMIC(_ views: UIView) {
        self.addSubview(views)
        views.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func makeSystem(_ button: UIButton) {
        button.addTarget(self, action: #selector(handleIn), for: [
            .touchDown,
            .touchDragInside
        ])
        button.addTarget(self, action: #selector(handleOut), for: [
            .touchDragOutside,
            .touchUpInside,
            .touchUpOutside,
            .touchDragExit,
            .touchCancel
        ])
    }
    
    @objc func handleIn() {
        UIView.animate(withDuration: 0.15) {self.alpha = 0.55}
    }
    
    @objc func handleOut() {
        UIView.animate(withDuration: 0.15) {self.alpha = 1}
    }
    
    func roundCorners(_ corner: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: corner,
                                cornerRadii: CGSize(width: radius, height: radius))
        
        let borderLayer = CAShapeLayer()
        borderLayer.frame = bounds
        borderLayer.path = path.cgPath
        borderLayer.strokeColor = UIColor.separator.cgColor
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.lineWidth = 1
        layer.addSublayer(borderLayer)
    }
}
