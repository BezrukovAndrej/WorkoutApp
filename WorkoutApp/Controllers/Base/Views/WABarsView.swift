//
//  WABarsView.swift
//  WorkoutApp
//
//  Created by Andrey Bezrukov on 12.07.2023.
//

import UIKit

final class WABarsView: UIView {
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillEqually
        return view
    }()
    
    func configure(with data: [WABarView.Data]) {
        data.forEach {
            let barView = WABarView(date: $0)
            stackView.addArrangedSubview(barView)
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
