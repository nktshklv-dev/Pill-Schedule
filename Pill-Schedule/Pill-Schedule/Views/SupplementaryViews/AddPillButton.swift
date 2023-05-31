//
//  AddPillButton.swift
//  Pills
//
//  Created by Nikita  on 3/31/23.
//

import UIKit
import SnapKit

class AddPillButton: UIButton {
    
    var plusButtonImage: UIImage? {
        guard let image = R.image.plusButtonImage() else {return nil}
        return image
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        self.setImage(plusButtonImage, for: .normal)
    }
    private func setupConstraints(){
        self.snp.makeConstraints { make in
            make.width.height.equalTo(48)
        }
    }
    
}
