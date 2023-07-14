//
//  SectionHeaderView.swift
//  WorkoutApp
//
//  Created by Andrey Bezrukov on 13.07.2023.
//

import UIKit

final class SectionHeaderView: UICollectionReusableView {
    static let id = Resouces.Header.id
    
    private let title: UILabel = {
        let label = UILabel()
        label.font = Resouces.Fonts.hellvelticaRegular(with: 13)
        label.textColor = .inactive
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        
        addSubviews()
        setConstraints()
    }
    
    func configure(with date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM dd"
        self.title.text = dateFormatter.string(from: date).uppercased()
    }
    
    private func addSubviews() {
        addViewsTAMIC(title)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
