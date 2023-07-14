//
//  StatsView.swift
//  WorkoutApp
//
//  Created by Andrey Bezrukov on 12.07.2023.
//

import UIKit

final class StatsView: WABaseInfoView {
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 15
        return view
    }()
    
    func configure(with items: [StatsItem]) {
        items.forEach {
            let itemView = StatsItemView()
            itemView.configure(with: $0)
            stackView.addArrangedSubview(itemView)
        }
    }
    
    override func addSubviews() {
        super.addSubviews()
        
        addViewsTAMIC(stackView)
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        NSLayoutConstraint.activate([
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
}
