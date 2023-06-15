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
    var pillNameTextField: UITextField!
    var pillDoseTextField: UITextField!
    var timeStampCollectionView: UICollectionView!
    var continueButton: ContinueButton!
    let timestamps: [TimestampsModel] = [TimestampsModel(title: "Nevermind", isSelected: true), TimestampsModel(title: "Before Meals", isSelected: false), TimestampsModel(title: "After Meals", isSelected: false), TimestampsModel(title: "With food", isSelected: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
}
