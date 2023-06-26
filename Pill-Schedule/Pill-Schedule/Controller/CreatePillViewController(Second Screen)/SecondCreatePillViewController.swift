//
//  SecondCreatePillViewController.swift
//  Pill-Schedule
//
//  Created by Nikita  on 6/26/23.
//

import UIKit

class SecondCreatePillViewController: UIViewController {

    var pageNumberLabel: UILabel!
    var titleLabel: UILabel!
    var verticalView: UIImageView!
    var pillImageView: UIImageView!
    var pillNameLabel: UILabel!
    var pillInfoLabel: UILabel!
    var pill: Pill!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        self.view.backgroundColor = .white
        pageNumberLabel = UILabel()
        pageNumberLabel?.text = "2 of 2"
        pageNumberLabel?.textColor = R.color.gray()
        pageNumberLabel?.font = UIFont.systemFont(ofSize: 16, weight: .light)
        self.view.addSubview(pageNumberLabel)
        
        titleLabel = UILabel()
        titleLabel?.text = "Schedule"
        titleLabel.textColor = R.color.dark()
        titleLabel.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        self.view.addSubview(titleLabel)
        
        verticalView = UIImageView()
        verticalView.image = R.image.rectangleView()
        self.view.addSubview(verticalView)
        
        pillImageView = UIImageView()
        pillImageView.contentMode = .scaleToFill
        pillImageView.image = pill.image
        self.view.addSubview(pillImageView)
        
        pillNameLabel = UILabel()
        pillNameLabel.text = pill.name
        pillNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        pillNameLabel.textColor = R.color.dark()
        self.view.addSubview(pillNameLabel)
        
        pillInfoLabel = UILabel()
        pillInfoLabel.text = pill.description
        pillInfoLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        pillInfoLabel.textColor = R.color.gray()
        self.view.addSubview(pillInfoLabel)
    }
    
    func setupConstraints() {
        pageNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(100)
            make.left.equalTo(view.snp.left).offset(24)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(pageNumberLabel.snp.bottom).offset(10)
            make.left.equalTo(pageNumberLabel.snp.left)
        }
        
        verticalView.snp.makeConstraints { make in
            make.left.equalTo(self.view).offset(24)
            make.top.equalTo(titleLabel.snp.bottom).offset(44)
        }
        
        pillImageView.snp.makeConstraints { make in
            make.width.height.equalTo(64)
            make.top.equalTo(verticalView)
            make.left.equalTo(verticalView.snp.right).offset(8)
        }
        
        pillNameLabel.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.top.equalTo(pillImageView).offset(6)
            make.left.equalTo(pillImageView.snp.right).offset(8)
        }
        
        pillInfoLabel.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.bottom.equalTo(pillImageView.snp.bottom).offset(-6)
            make.left.equalTo(pillNameLabel)
        }
        
        
    }
}
