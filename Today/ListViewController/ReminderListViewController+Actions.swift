//
//  ReminderListViewController+Actions.swift
//  Today
//
//  Created by Алиса on 03/03/26.
//

import UIKit

extension ReminderListViewController {
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else { return }
        completeReminder(withId: id)
    }
}
