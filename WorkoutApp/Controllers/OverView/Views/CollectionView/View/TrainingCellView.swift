//
//  CellView.swift
//  WorkoutApp
//
//  Created by Andrey Bezrukov on 13.07.2023.
//

import UIKit

enum CellRoundedType {
    case top, bottom, all, noRounded
}

final class TrainingCellView: UICollectionViewCell {
    static let id = Resouces.TrainingCell.id
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 3
        return view
    }()
    
    private let checkMarkView: UIImageView = {
        let view = UIImageView()
        view.image = Resouces.Overview.checkMark
        view.tintColor = .active
        return view
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        label.font = Resouces.Fonts.hellvelticaRegular(with: 17)
        label.textColor = .titleGray
        return label
    }()
    
    private let subtitle: UILabel = {
        let label = UILabel()
        label.font = Resouces.Fonts.hellvelticaRegular(with: 13)
        label.textColor = .inactive
        return label
    }()
    
    private let rightArrowView: UIImageView = {
        let view = UIImageView()
        view.image = Resouces.Overview.rightarrow
        return view
    }()
    
    func configure(with title: String, subtitle: String, isDone: Bool, roundedType: CellRoundedType) {
        self.title.text = title
        self.subtitle.text = subtitle
        
        checkMarkView.image = isDone ? Resouces.Overview.checkMark : Resouces.Overview.notCheck
        checkMarkView.tintColor = isDone ? .active : .separator
        
        switch roundedType {
        case .all: self.roundCorners(.allCorners, radius: 5)
        case .bottom: self.roundCorners([.bottomLeft, .bottomRight], radius: 5)
        case .top: self.roundCorners([.topLeft, .topRight], radius: 5)
        case .noRounded: self.roundCorners([.allCorners], radius: 0)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private func
    
    private func setupView() {
        backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = UIColor.separator.cgColor
    }
    
    private func addSubviews() {
        [checkMarkView, stackView, rightArrowView].forEach {addViewsTAMIC($0)}
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(subtitle)
    }
}

// MARK: - Set Constraints

extension TrainingCellView {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            checkMarkView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            checkMarkView.centerYAnchor.constraint(equalTo:centerYAnchor),
            checkMarkView.heightAnchor.constraint(equalToConstant: 28),
            checkMarkView.widthAnchor.constraint(equalTo: checkMarkView.heightAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: checkMarkView.trailingAnchor, constant: 15),
            stackView.centerYAnchor.constraint(equalTo:centerYAnchor),
            stackView.trailingAnchor.constraint(equalTo: rightArrowView.leadingAnchor, constant: -15),
            
            rightArrowView.centerYAnchor.constraint(equalTo: centerYAnchor),
            rightArrowView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            rightArrowView.heightAnchor.constraint(equalToConstant: 12),
            rightArrowView.widthAnchor.constraint(equalToConstant: 7)
        ])
    }
}
