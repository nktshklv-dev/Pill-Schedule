//
//  ChosePillButtonView.swift
//  Pills
//
//  Created by Nikita  on 4/6/23.
//

import UIKit
import SnapKit
import RealmSwift

class ChoosePillButtonView: UIStackView {
    
    enum PillType: String, PersistableEnum{
        case pill
        case capsule
        case ampoule
        case inhaler
        
        var imageDescription: String {
            switch self {
            case .pill: return "pill"
            case .capsule: return "capsule"
            case .inhaler: return "inhaler"
            case .ampoule: return "ampoule"
            }
        }
    }
    

    var currentSelectedPill: PillType?
    private var pillButton: PillButton!
    private var capsuleButton: PillButton!
    private var ampouleButton: PillButton!
    private var inhalerButton: PillButton!
    var delegate: ChoosePillButtonViewDelegate? = nil 
    var stackView: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        pillButton = PillButton()
        pillButton.changeImage(to: .pill)
        pillButton.isUserInteractionEnabled = true
        pillButton.addTarget(self, action: #selector(didTapPillButton), for: .touchUpInside)
        self.addSubview(pillButton)
    
        capsuleButton = PillButton()
        capsuleButton.changeImage(to: .capsule)
        capsuleButton.isUserInteractionEnabled = true
        capsuleButton.addTarget(self, action: #selector(didTapPillButton), for: .touchUpInside)
        self.addSubview(capsuleButton)
        
        ampouleButton = PillButton()
        ampouleButton.changeImage(to: .ampoule)
        ampouleButton.isUserInteractionEnabled = true
        ampouleButton.addTarget(self, action: #selector(didTapPillButton), for: .touchUpInside)
        self.addSubview(ampouleButton)
        
        inhalerButton = PillButton()
        inhalerButton.changeImage(to: .inhaler)
        inhalerButton.isUserInteractionEnabled = true
        inhalerButton.addTarget(self, action: #selector(didTapPillButton), for: .touchUpInside)
        self.addSubview(inhalerButton)
        
        stackView = UIStackView()
        stackView.spacing = 5
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(pillButton)
        stackView.addArrangedSubview(capsuleButton)
        stackView.addArrangedSubview(ampouleButton)
        stackView.addArrangedSubview(inhalerButton)
        self.addSubview(stackView) 
    }
    private func setupConstraints(){
       
        stackView.snp.makeConstraints { make in
            make.width.equalTo(self).multipliedBy(0.95)
            make.height.equalTo(64)
            make.centerX.equalTo(self)
            make.top.equalTo(self)
        }
    }
    
}
