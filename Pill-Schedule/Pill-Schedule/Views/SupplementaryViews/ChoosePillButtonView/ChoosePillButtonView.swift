//
//  ChosePillButtonView.swift
//  Pills
//
//  Created by Nikita  on 4/6/23.
//

import UIKit
import SnapKit

class ChoosePillButtonView: UIStackView {
    
    enum PillButton: String{
        case pillButton
        case capsuleButton
        case ampouleButton
        case inhalerButton
    }
    var pillsView = UIStackView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
       pillsView = createPillsView()
       self.addSubview(pillsView)
    }
    private func setupConstraints(){
        pillsView.snp.makeConstraints { make in
            make.width.equalTo(self.snp.width)
            make.height.equalTo(100)
            make.centerX.equalTo(self.snp.centerX)
        }
    }
    
    private func createPillsView() -> UIStackView{
        let buttonTypes: [PillButton] = [.pillButton, .capsuleButton, .ampouleButton, .inhalerButton]
        let stack = UIStackView()
       
        for type in buttonTypes{
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
            button.setImage(UIImage(named: type.rawValue), for: .normal)
            button.addTarget(self, action: #selector(didTapPillButton), for: .touchUpInside)
            stack.addArrangedSubview(button)
        }
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }
}
