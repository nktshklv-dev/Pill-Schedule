//
//  PillEditViewController+Actions.swift
//  Pill-Schedule
//
//  Created by Nikita  on 7/31/23.
//

import Foundation
import UIKit

extension  PillEditViewController {
    
    @objc func didTapDoneButton() {
        
    }
    
    @objc func didTapCancelButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }

    @objc func didTapAddReminderButton() {
        reminderStackViewHeight += 44
        let reminder = createReminder()
        UIView.animate(withDuration: 0.35) {
            self.reminderStackView.snp.updateConstraints { make in
                make.height.equalTo(self.reminderStackViewHeight)
            }
            self.addReminder(reminder: reminder)
            self.view.layoutIfNeeded()
        }
        
    }
    
    
    
}
