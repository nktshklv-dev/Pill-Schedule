//
//  ReminderViewDelegate.swift
//  Pill-Schedule
//
//  Created by Nikita  on 6/27/23.
//

import Foundation
 

protocol ReminderViewDelegate {
    func removeReminder()
    func didSetTimeByDatePicker(date: Date)
}
