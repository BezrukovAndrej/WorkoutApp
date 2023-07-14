//
//  WAButton.swift
//  WorkoutApp
//
//  Created by Andrey Bezrukov on 07.07.2023.
//

import UIKit

public enum WAButtonType {
    case primary
    case secondary
}

final class WAButton: UIButton {
    
    private var type: WAButtonType = .primary
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private let iconView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "chevron.down")?.withRenderingMode(.alwaysTemplate)
        return image
    }()
    
    init(with type: WAButtonType) {
        super.init(frame: .zero)
        self.type = type
        
        addSubviews()
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        
        addSubviews()
        setupViews()
        setConstraints()
    }
    
    func setTitle(_ title: String?) {
        label.text = title
    }
    
    private func setupViews() {
        switch type {
        case .primary:
            label.textColor = .inactive
            iconView.tintColor = .inactive
            label.font = Resouces.Fonts.hellvelticaRegular(with: 13)
        case .secondary:
            label.textColor = .active
            iconView.tintColor = .active
            label.font = Resouces.Fonts.hellvelticaRegular(with: 15)
            backgroundColor = .separator
            layer.cornerRadius = 14
        }
        
        makeSystem(self)
    }
    
    private func addSubviews() {
        [label, iconView].forEach {addViewsTAMIC($0)}
    }
    
    private func setConstraints() {
        
        var horisontalOffset: CGFloat {
            switch type {
            case .primary: return 0
            case .secondary: return 10
            }
        }
        
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horisontalOffset),
            iconView.heightAnchor.constraint(equalToConstant: 5),
            iconView.widthAnchor.constraint(equalToConstant: 10),
            
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.trailingAnchor.constraint(equalTo: iconView.leadingAnchor, constant: -10),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horisontalOffset * 2)
        ])
    }
}
