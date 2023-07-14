//
//  ProgressController.swift
//  WorkoutApp
//
//  Created by Andrey Bezrukov on 26.06.2023.
//

import UIKit

final class ProgressController: WABaseController {
    
    private let dailyPerformanceView = DailyPerformanceView(with: Resouces.Progress.dailyPerfomance,
                                                            buttonTitle: Resouces.Progress.last7Days.uppercased())
    private let monthlyPerfomanceView = MonthPerfomanceView(with: Resouces.Progress.monthlyPerfomance,
                                                           buttonTitle: Resouces.Progress.last10Months.uppercased())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [dailyPerformanceView, monthlyPerfomanceView].forEach {view.addViewsTAMIC($0)}
        
        setupViews()
        setConstraints()
        
        title = Resouces.Progress.title
        navigationController?.tabBarItem.title = Resouces.Progress.titleBar
        
        addNavBarButton(at: .left, with: Resouces.Progress.leftButton)
        addNavBarButton(at: .right, with: Resouces.Progress.rightButton)
    }
    
    private func setupViews() {
        dailyPerformanceView.configure(with: [.init(value: "1", heightMultiplier: 0.2, title: "Mon"),
                                              .init(value: "2", heightMultiplier: 0.4, title: "Tue"),
                                              .init(value: "3", heightMultiplier: 0.6, title: "Wed"),
                                              .init(value: "4", heightMultiplier: 0.8, title: "Thu"),
                                              .init(value: "5", heightMultiplier: 1, title: "Fri"),
                                              .init(value: "3", heightMultiplier: 0.6, title: "Sat"),
                                              .init(value: "2", heightMultiplier: 0.4, title: "Sun")])
        
        monthlyPerfomanceView.configure(with: [.init(value: 45, title: "Mar"),
                                               .init(value: 55, title: "Apr"),
                                               .init(value: 60, title: "May"),
                                               .init(value: 65, title: "Jun"),
                                               .init(value: 70, title: "Jul"),
                                               .init(value: 80, title: "Aug"),
                                               .init(value: 65, title: "Sep"),
                                               .init(value: 45, title: "Oct"),
                                               .init(value: 30, title: "Nov"),
                                               .init(value: 15, title: "Dec")],
                                        topChartOffset: 10)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            dailyPerformanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            dailyPerformanceView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            dailyPerformanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            dailyPerformanceView.heightAnchor.constraint(equalTo: dailyPerformanceView.widthAnchor, multiplier: 0.68),
            
            monthlyPerfomanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            monthlyPerfomanceView.topAnchor.constraint(equalTo: dailyPerformanceView.bottomAnchor, constant: 15),
            monthlyPerfomanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            monthlyPerfomanceView.heightAnchor.constraint(equalTo: monthlyPerfomanceView.widthAnchor, multiplier: 1.06)
        ])
    }
}
