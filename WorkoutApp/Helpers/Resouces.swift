//
//  Resouces.swift
//  WorkoutApp
//
//  Created by Andrey Bezrukov on 25.06.2023.
//

import UIKit

enum Resouces {
    
    enum String {
        enum TabBar {
            static let overview = "Overview"
            static let session = "Session"
            static let progress = "Progress"
            static let settings = "Settings"
        }
        
        enum Overview {
            static let allWorkoutsButton = "All Workouts"
            static let naBar = "Today"
        }
    }
    
    enum Images {
        enum TabBar {
            static let overview = UIImage(named: "house")
            static let session = UIImage(named: "clock")
            static let progress = UIImage(named: "analytics")
            static let settings = UIImage(named: "gear")
        }
    }
    
    enum Overview {
        static let checkMark = UIImage(systemName: "checkmark.circle.fill")
        static let rightarrow = UIImage(named: "rightarrow")
        static let notCheck = UIImage(systemName: "circle")
    }
    
    enum Session {
        static let title = "High Intensity Cardio"
        static let elepsedTime = "Elapsed Time"
        static let remainingTime = "Remaining Time"
        static let workoutStats = "Workout stats"
        static let stepsCounter = "Steps counter"
        
        static let heartRate = "Heart rate"
        static let averagePace = "Avarage Pace"
        static let totalSteps = "Total steps"
        static let totalDistance = "Total Distance"
    }
    
    enum Progress {
        static let title = "Workout Progress"
        static let titleBar = "Progress"
        static let dailyPerfomance = "Daily performance"
        static let last7Days = "Last 7 days"
        static let monthlyPerfomance = "Monthly Performance"
        static let last10Months = "Last 10 months"
        static let leftButton = "Export"
        static let rightButton = "Details"
    }
    
    enum Settings {
        static let title = "Settings"
    }
    
    enum NavBar {
        static let navLeftButtonStart  = "Start"
        static let navLeftButtonPause  = "Pause"
        static let navRightButtonFinish  = "Finish"
    }
    
    enum Header {
        static let id = "SectionHeaderView"
    }
    
    enum TrainingCell {
        static let id = "TrainingCellView"
    }
    
    enum Fonts {
        static func hellvelticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
}
