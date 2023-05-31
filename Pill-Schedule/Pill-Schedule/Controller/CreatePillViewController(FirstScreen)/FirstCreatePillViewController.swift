//
//  FirstCreatePillViewController.swift
//  Pills
//
//  Created by Nikita  on 4/3/23.
//

import UIKit
import SnapKit

class FirstCreatePillViewController: UIViewController {
    
    var pageNumberLabel = UILabel()
    var titleLabel = UILabel()
    var pillsView = ChoosePillButtonView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
}
