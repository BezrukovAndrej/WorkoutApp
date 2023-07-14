//
//  NavBarController.swift
//  WorkoutApp
//
//  Created by Andrey Bezrukov on 26.06.2023.
//

import UIKit

final class NavBarController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .white
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.darkGray,
            .font: Resouces.Fonts.hellvelticaRegular(with: 17)
        ]
        
        navigationBar.addBottomBorder(with: .separator, height: 1)
    }
}
