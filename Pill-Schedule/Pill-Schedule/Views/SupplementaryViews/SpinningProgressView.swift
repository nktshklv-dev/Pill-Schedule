//
//  SpinningProgressView.swift
//  Pill-Schedule
//
//  Created by Nikita  on 6/1/23.
//

import UIKit

class SpinningProgressView: UIView {

    private var spinner: UIActivityIndicatorView!
    private var backgroundView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundView = setupBlurView()
        backgroundView.layer.cornerRadius = 12.5
        backgroundView.clipsToBounds = true
        self.addSubview(backgroundView)
        
        spinner = UIActivityIndicatorView()
        spinner.stopAnimating()
        self.addSubview(spinner)
    }
    
    private func setupConstraints() {
        backgroundView.snp.makeConstraints { make in
            make.width.height.equalTo(100)
        }
        
        spinner.snp.makeConstraints { make in
            make.centerX.equalTo(backgroundView)
            make.centerY.equalTo(backgroundView)
            make.width.height.equalTo(100)
        }
    }
    
    private func setupBlurView() -> UIView{
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.extraLight)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return blurEffectView
    }
    
    func startSpinning() {
        spinner.startAnimating()
    }
    
    func stopSpinning() {
        spinner.stopAnimating()
    }
    

}
