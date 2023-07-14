//
//  WABaseController.swift
//  WorkoutApp
//
//  Created by Andrey Bezrukov on 26.06.2023.
//

import UIKit

enum navBarPosition {
    case left
    case right
}

class WABaseController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
}

@objc extension WABaseController {
    
    func addView() {}
    
    func layoutViews() {}
    
    func configure() {
        view.backgroundColor = .background
    }
    
    func navBarLeftButtonHandler() {
    }
    
    func navBarRightButtonHandler() {
    }
}

extension WABaseController {
    
    func addNavBarButton(at position: navBarPosition, with title: String) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.active, for: .normal)
        button.setTitleColor(.inactive, for: .disabled)
        button.titleLabel?.font = Resouces.Fonts.hellvelticaRegular(with: 17)
        
        switch position {
        case.left:
            button.addTarget(self, action: #selector(navBarLeftButtonHandler), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case.right:
            button.addTarget(self, action: #selector(navBarRightButtonHandler), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
}
