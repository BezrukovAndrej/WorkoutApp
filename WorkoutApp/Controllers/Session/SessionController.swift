//
//  SessionController.swift
//  WorkoutApp
//
//  Created by Andrey Bezrukov on 26.06.2023.
//

import UIKit

final class SessionController: WABaseController {
    
    private let statsView = StatsView(with: Resouces.Session.workoutStats)
    private let stapsView = StepsView(with: Resouces.Session.stepsCounter)
    private let timerView = WABaseInfoView()
    private let statsItemView = StatsItemView()
    private let timer = TimerView()
    private let timerDuration = 10.0
    
    override func navBarLeftButtonHandler() {
        if timer.state == .isStopped {
            timer.startTimer {[weak self] in
                guard let self = self else { return }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.navBarRightButtonHandler()
                }
            }
            addNavBarButton(at: .left, with: Resouces.NavBar.navLeftButtonPause)
        } else {
            addNavBarButton(at: .left, with: Resouces.NavBar.navLeftButtonStart)
            timer.pauseTimer()
        }
        
        timer.state = timer.state == .isRuning ? .isStopped : .isRuning
    }
    
    override func navBarRightButtonHandler() {
        timer.stopTimer()
        timer.state = .isStopped
        addNavBarButton(at: .left, with: Resouces.NavBar.navLeftButtonStart)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setConstraints()
        
        title = Resouces.Session.title
        navigationController?.tabBarItem.title = Resouces.String.TabBar.session
        
        addNavBarButton(at: .left, with: Resouces.NavBar.navLeftButtonStart)
        addNavBarButton(at: .right, with: Resouces.NavBar.navRightButtonFinish)
        
        timer.configure(with: timerDuration, progress: 0)
        
        statsView.configure(with: [.heartRate(value: "155"),
                                   .averagePace(value: "9'20''"),
                                   .totalSteps(value: "7.682"),
                                   .totalDistance(value: "8.25")])
        
        stapsView.configure(with: [.init(value: "8к", heightMultiplier: 1, title: "2/14"),
                                   .init(value: "7k", heightMultiplier: 0.8, title: "2/15"),
                                   .init(value: "5k", heightMultiplier: 0.6, title: "2/16"),
                                   .init(value: "6k", heightMultiplier: 0.7, title: "2/17")])
    }
    
    private func addSubviews() {
        [timerView, statsView, stapsView].forEach{view.addViewsTAMIC($0)}
        timerView.addViewsTAMIC(timer)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            timerView.bottomAnchor.constraint(equalTo: timer.bottomAnchor),
            
            timer.leadingAnchor.constraint(equalTo: timerView.leadingAnchor, constant: 5),
            timer.topAnchor.constraint(equalTo: timerView.topAnchor),
            timer.trailingAnchor.constraint(equalTo: timerView.trailingAnchor, constant: -5),
            timer.heightAnchor.constraint(equalTo: timer.widthAnchor),
            
            statsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            statsView.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 10),
            statsView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -7.5),
            
            stapsView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 7.5),
            stapsView.topAnchor.constraint(equalTo: statsView.topAnchor),
            stapsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            stapsView.heightAnchor.constraint(equalTo: statsView.heightAnchor),
        ])
    }
}
