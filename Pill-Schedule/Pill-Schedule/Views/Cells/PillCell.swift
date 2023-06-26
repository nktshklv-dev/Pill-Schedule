//
//  PillCell.swift
//  Pills
//
//  Created by Nikita  on 3/17/23.
//

import UIKit
import SnapKit

enum PillImageType: String{
    case capsule
    case pill
    case ampoule
    case inhaler
    
    var image: UIImage? {
        switch self {
        case .capsule:
            return R.image.capsule()
        case .pill:
            return R.image.pill()
        case .ampoule:
            return R.image.ampoule()
        case .inhaler:
            return R.image.inhaler()
        }
    }
}

class PillCell: UICollectionViewCell {
    
    static let reuseIdentifier = "PillCell"
    var imageType: ChoosePillButtonView.PillType = .pill {
        didSet{
            switch imageType {
            case .pill:
                pillImageView.image
                = R.image.pill()
            case .capsule:
                pillImageView.image = R.image.capsule()
            case .ampoule:
                pillImageView.image = R.image.ampoule()
            case .inhaler:
                pillImageView.image = R.image.inhaler()
            }
        }
    }
    private let pillImageView = UIImageView()
    private let mainTitle = UILabel()
    private let secondaryTitle = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        self.layer.cornerRadius = 24
        self.layer.borderWidth = 1
        self.layer.borderColor = R.color.gray3()?.cgColor
        
        pillImageView.image = R.image.pill()
        pillImageView.backgroundColor = .white
        self.addSubview(pillImageView)
        
        mainTitle.font = UIFont.boldSystemFont(ofSize: 20)
        mainTitle.textColor = R.color.dark()
        self.addSubview(mainTitle)
        
        secondaryTitle.font = UIFont.systemFont(ofSize: 16)
        secondaryTitle.textColor = R.color.gray()
        secondaryTitle.numberOfLines = 0
        self.addSubview(secondaryTitle)
    }
    private func setupConstraints(){
        pillImageView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(10)
            make.left.equalTo(self.snp.left).offset(10)
        }
        
        mainTitle.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(24)
            make.left.equalTo(self.snp.left).offset(88)
        }
        
        secondaryTitle.snp.makeConstraints { make in
            make.top.equalTo(mainTitle.snp.bottom).offset(8)
            make.left.equalTo(mainTitle.snp.left)
        }
    }
    
    func setupCell(for pill: Pill){
        mainTitle.text = pill.name
        secondaryTitle.text = pill.description
        imageType = pill.imageType
        
    }
}
