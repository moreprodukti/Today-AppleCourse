//
//  ReminderListViewController.swift
//  Today
//
//  Created by Алиса on 02/03/26.
//

import UIKit

class ReminderListViewController: UICollectionViewController {
    
    var dataSource: DataSource?
    var reminders: [Reminder] = Reminder.sampleData
    
    var reminderCompletedValue: String {
        NSLocalizedString("Completed", comment: "Reminder completed value")
    }
    
    var reminderNotCompletedValue: String {
        NSLocalizedString("Not completed", comment: "Reminder not completed value")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        
        dataSource = DataSource(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: Reminder.ID) in
            return collectionView.dequeueConfiguredReusableCell(
                using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        updateSnapshot()
        
        collectionView.dataSource = dataSource
    }

    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
}

