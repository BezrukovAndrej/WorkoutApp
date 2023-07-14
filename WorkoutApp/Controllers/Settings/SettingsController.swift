//
//  SettingsController.swift
//  WorkoutApp
//
//  Created by Andrey Bezrukov on 26.06.2023.
//

import UIKit

final class SettingsController: WABaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Resouces.Settings.title
        navigationController?.tabBarItem.title = Resouces.Settings.title
    }
}
