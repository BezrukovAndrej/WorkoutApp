//
//  StatsItemView.swift
//  WorkoutApp
//
//  Created by Andrey Bezrukov on 12.07.2023.
//

import UIKit

enum StatsItem {
    case heartRate(value: String)
    case averagePace(value: String)
    case totalSteps(value: String)
    case totalDistance(value: String)
    
    var data: StatsItemView.ItemData {
        switch self {
        case .heartRate(let value):
            return .init(imageName: UIImage(named: "HeartIcon"),
                         value: "\(value) bpm",
                         title: Resouces.Session.heartRate)
        case .averagePace(let value):
            return .init(imageName: UIImage(named: "SpeedIcon"),
                         value: "\(value) / km",
                         title: Resouces.Session.averagePace)
        case .totalSteps(let value):
            return .init(imageName: UIImage(named: "StepsIcon"),
                         value: "\(value)",
                         title: Resouces.Session.totalDistance)
        case .totalDistance(let value):
            return .init(imageName: UIImage(named: "MapsIcon"),
                         value: "\(value) km",
                         title: Resouces.Session.totalSteps)
        }
    }
}

final class StatsItemView: UIView {
    
    struct ItemData {
        let imageName: UIImage?
        let value: String
        let title: String
    }
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = Resouces.Fonts.hellvelticaRegular(with: 17)
        label.textColor = .titleGray
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resouces.Fonts.hellvelticaRegular(with: 10)
        label.textColor = .inactive
        return label
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with item: StatsItem) {
        imageView.image = item.data.imageName
        valueLabel.text = item.data.value
        titleLabel.text = item.data.title.uppercased()
    }
    
    private func addSubviews() {
        [imageView, stackView].forEach{addViewsTAMIC($0)}
        stackView.addArrangedSubview(valueLabel)
        stackView.addArrangedSubview(titleLabel)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 23),
            
            stackView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 15),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
