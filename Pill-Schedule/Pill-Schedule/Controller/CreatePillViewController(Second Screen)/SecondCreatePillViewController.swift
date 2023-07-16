//
//  SecondCreatePillViewController.swift
//  Pill-Schedule
//
//  Created by Nikita  on 6/26/23.
//

import UIKit

class SecondCreatePillViewController: UIViewController, ReminderViewDelegate, RemindInViewDelegate {
   
    var pageNumberLabel: UILabel!
    var titleLabel: UILabel!
    var verticalView: UIImageView!
    var pillImageView: UIImageView!
    var pillNameLabel: UILabel!
    var pillInfoLabel: UILabel!
    var pill: Pill!
    var reminderStackView: UIStackView!
    var addReminderButton: UIButton!
    var promptLabel: UILabel!
    var reminderStackViewHeight = 24
    var width: CGFloat = 0
    var remindInView: RemindInView!
    var continueButton: ContinueButton!
    var mainReminderTimes: [Date] = [] {
        didSet {
            cuttedReminderTimes = mainReminderTimes
        }
    }
    var cuttedReminderTimes: [Date] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        
        self.width = self.view.frame.width
    }
}
