//
//  XAxisView.swift
//  WorkoutApp
//
//  Created by Andrey Bezrukov on 13.07.2023.
//

import UIKit

final class XAxisView: UIView {
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillEqually
        return view
    }()
    
    func configure(with data: [WAChartsView.Data]) {
        stackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        
        data.forEach {
            let label = UILabel()
            label.font = Resouces.Fonts.hellvelticaRegular(with: 9)
            label.textColor = .inactive
            label.textAlignment = .center
            label.text = $0.title.uppercased()
            
            stackView.addArrangedSubview(label)
        }
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
        addViewsTAMIC(stackView)
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
