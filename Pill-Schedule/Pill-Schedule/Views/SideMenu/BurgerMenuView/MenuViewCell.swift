//
//  MenuViewCell.swift
//  Pills
//
//  Created by Nikita  on 4/14/23.
//

import UIKit

class MenuViewCell: UICollectionViewCell {
    static let reuseIdentifier = "MenuViewCell"
    private var title = UILabel()
    private var lineView = UIView()
    var titleText = "" {
        didSet {
            title.text = titleText
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = R.color.gray4()
        setupViews()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        title = UILabel()
        title.text = titleText
        title.font = UIFont.boldSystemFont(ofSize: 25)
        title.textColor = R.color.dark()
        title.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(title)
        
        lineView = UILabel()
        lineView.backgroundColor = R.color.blue()
        lineView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(lineView)
        
    }
    private func setupConstraints(){
        title.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(10)
            make.left.equalTo(self.snp.left).offset(10)
        }

        lineView.snp.makeConstraints { make in
            make.height.equalTo(1.2)
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.top.equalTo(title.snp.bottom).offset(2)
            make.left.equalTo(title.snp.left)
        }
    }
    
}
