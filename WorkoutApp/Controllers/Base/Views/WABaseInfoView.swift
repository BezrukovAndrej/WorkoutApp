//
//  WABaseInfoView.swift
//  WorkoutApp
//
//  Created by Andrey Bezrukov on 10.07.2023.
//

import UIKit

class WABaseInfoView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resouces.Fonts.hellvelticaRegular(with: 13)
        label.textColor = .inactive
        return label
    }()
    
    @objc 
    private lazy var button = WAButton(with: .primary)
    
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.separator.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        return view
    }()
    
    init(with title: String? = nil, buttonTitle: String? = nil) {
        super.init(frame: .zero)
        
        titleLabel.text = title?.uppercased()
        titleLabel.textAlignment = buttonTitle == nil ? .center : .left
        
        button.setTitle(buttonTitle)
        button.isHidden = buttonTitle == nil ? true : false
        
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addButtonTarget(target: Any? , action: Selector) {
        button.addTarget(action, action: action, for: .touchUpInside)
    }
    
    func addSubviews() {
        [titleLabel, contentView, button].forEach{addViewsTAMIC($0)}
    }
    
    func setConstraints() {
        
        let contentTopAncer: NSLayoutAnchor = titleLabel.text == nil ? topAnchor : titleLabel.bottomAnchor
        let contentTopOffSet: CGFloat = titleLabel.text == nil ? 0 : 10
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 28),
            
            contentView.topAnchor.constraint(equalTo: contentTopAncer, constant: contentTopOffSet),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
