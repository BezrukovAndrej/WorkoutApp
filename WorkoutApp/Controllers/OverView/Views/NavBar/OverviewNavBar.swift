//
//  OverviewNavBar.swift
//  WorkoutApp
//
//  Created by Andrey Bezrukov on 07.07.2023.
//

import UIKit

final class OverviewNavBar: UIView {
    
    private let weekView = WeekView()
    
    private let allWorkoutsButton: WAButton = {
        let button = WAButton(with: .secondary)
        button.setTitle(Resouces.String.Overview.allWorkoutsButton)
        return button
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        let imageButton = UIImage(named: "addButton")
        button.setImage(imageButton, for: .normal)
        button.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Resouces.String.Overview.naBar
        label.font = Resouces.Fonts.hellvelticaRegular(with: 22)
        label.textColor = .inactive
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addBottomBorder(with: .separator, height: 1)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func allWorkoutsButtonAction() {
        
    }
    
    @objc private func addButtonAction() {
        
    }
    
    private func addSubviews() {
        [addButton, allWorkoutsButton, titleLabel, weekView].forEach {addViewsTAMIC($0)}
    }
    
    private func setupViews() {
        backgroundColor = .white
        allWorkoutsButton.setTitle(Resouces.String.Overview.allWorkoutsButton)
        allWorkoutsButton.addTarget(self,
                                    action: #selector(allWorkoutsButtonAction),
                                    for: .touchUpInside)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            addButton.heightAnchor.constraint(equalToConstant: 28),
            addButton.widthAnchor.constraint(equalToConstant: 28),
            
            allWorkoutsButton.topAnchor.constraint(equalTo: addButton.topAnchor),
            allWorkoutsButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -15),
            allWorkoutsButton.heightAnchor.constraint(equalToConstant: 28),
            
            titleLabel.centerYAnchor.constraint(equalTo: allWorkoutsButton.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: allWorkoutsButton.leadingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            weekView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 15),
            weekView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            weekView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            weekView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            weekView.heightAnchor.constraint(equalToConstant: 47)
        ])
    }
}
