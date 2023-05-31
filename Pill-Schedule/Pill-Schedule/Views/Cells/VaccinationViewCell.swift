//
//  VaccinationViewCell.swift
//  Pills
//
//  Created by Nikita  on 3/15/23.
//

import UIKit

class VaccinationViewCell: UICollectionViewCell {
    
    static let identifier = "VaccinationViewCell"
    private var background: UIView!
    private let mainTitle = UILabel()
    private let secondaryTitle = UILabel()
    private var syringeImageView = UIImageView()
    private var closeButton = UIButton()
    var delegate: VaccinationMenuDelegate? = nil
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
        self.clipsToBounds = true
        background = setupBackground()
        self.addSubview(background)
        
        mainTitle.text = "Get vaccinated!"
        mainTitle.font = UIFont.boldSystemFont(ofSize: 20)
        mainTitle.textColor = .white
        self.addSubview(mainTitle)
        
        secondaryTitle.text = "Nearest vaccination center"
        secondaryTitle.font = UIFont.systemFont(ofSize: 16)
        secondaryTitle.textColor = .white
        self.addSubview(secondaryTitle)
        
        syringeImageView.image = R.image.syringeImage()
        background.addSubview(syringeImageView)
        
        closeButton.setImage(R.image.smallCloseButton(), for: .normal)
        closeButton.addTarget(self, action: #selector(didTapCloseVaccinationMenu), for: .touchUpInside)
        self.addSubview(closeButton)
    }
    
    private func setupBackground() -> UIView{
        background = UIImageView(image: R.image.background())
        background.addSubview(UIImageView(image: R.image.gradient()))
        return background
    }
    
    private func setupConstraints(){
        background.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left)
            make.bottom.equalTo(self.snp.bottom)
        }
        
        mainTitle.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left).offset(24)
            make.top.equalTo(background.snp.top).offset(23)
        }
        
        secondaryTitle.snp.makeConstraints { make in
            make.left.equalTo(mainTitle.snp.left)
            make.bottom.equalTo(self.snp.bottom).offset(-20)
        }
        
        syringeImageView.snp.makeConstraints { make in
            make.right.equalTo(self.snp.right)
            make.bottom.equalTo(self.snp.bottom)
        }
        
        closeButton.snp.makeConstraints { make in
            make.top.equalTo(background.snp.top).offset(10)
            make.right.equalTo(self.snp.right).offset(-16)
        }
    }
    @objc func didTapCloseVaccinationMenu(){
        delegate?.closeVaccinationMenu()
    }
}
