//
//  OverViewController.swift
//  WorkoutApp
//
//  Created by Andrey Bezrukov on 25.06.2023.
//

import UIKit

struct TrainigDate {
    struct Data {
        let title: String
        let subtitle: String
        let isDone: Bool
    }
    
    let date: Date
    let items: [Data]
}

final class OverViewController: WABaseController {
    
    private let navBar = OverviewNavBar()
    private let header = SectionHeaderView()
    private var dataSource: [TrainigDate] = []
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = .clear
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setupViews()
        setContraints()
    }
    
    private func setupViews() {
        navigationController?.navigationBar.isHidden = true
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        dataSource = [
            .init(date: Date(),
                  items: [.init(title: "Warm Up Cardio", subtitle: "Stair Climber • 10 minutes", isDone: true),
                          .init(title: "High Intensity Cardio", subtitle: "Treadmill • 50 minutes", isDone: false)]),
            .init(date: Date(), items: [  .init(title: "Warm Up Cardio", subtitle: "Treadmill • 10 minutes", isDone: false),
                                          .init(title: "Chest Workout", subtitle: "Bench Press • 3 sets • 10 reps", isDone: false),
                                          .init(title: "Tricep Workout", subtitle: "Overhead Extension • 5 sets • 8 reps", isDone: false)]),
            .init(date: Date(), items: [.init(title: "Cardio Interval Workout", subtitle: "Treadmill • 60 minutes", isDone: false),
                                        .init(title: "Chest Workout", subtitle: "Bench Press • 3 sets • 10 reps", isDone: true),
                                        .init(title: "Tricep Workout", subtitle: "Overhead Extension • 5 sets • 8 reps", isDone: false)])]
        
        collectionView.reloadData()
        
        collectionView.register(TrainingCellView.self, forCellWithReuseIdentifier: TrainingCellView.id)
        collectionView.register(SectionHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: SectionHeaderView.id)
    }
    
    private func addSubviews() {
        view.addViewsTAMIC(navBar)
        view.addViewsTAMIC(collectionView)
    }
}

// MARK: - UICollectionViewDataSource

extension OverViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrainingCellView.id, for: indexPath) as? TrainingCellView else { return UICollectionViewCell() }
        
        let item = dataSource[indexPath.section].items[indexPath.row]
        
        let roundedType: CellRoundedType
        if indexPath.row == 0 && indexPath.row == dataSource[indexPath.section].items.count - 1 {
            roundedType = .all
        } else if  indexPath.row == 0 {
            roundedType = .top
        } else if indexPath.row == 0 && indexPath.row == dataSource[indexPath.section].items.count - 1 {
            roundedType = .bottom
        } else {
            roundedType = .noRounded
        }
        
        cell.configure(with: item.title, subtitle: item.subtitle, isDone: item.isDone, roundedType: roundedType)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeaderView.id, for: indexPath) as? SectionHeaderView else { return UICollectionReusableView() }
        
        view.configure(with: dataSource[indexPath.section].date)
        return view
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension OverViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 32)
    }
}

// MARK: - Set Constraints

extension OverViewController {
    
    private func setContraints() {
        
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: navBar.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
