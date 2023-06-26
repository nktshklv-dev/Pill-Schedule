//
//  FirstCreatePillViewController+Delegate.swift
//  Pill-Schedule
//
//  Created by Nikita  on 6/26/23.
//

import Foundation

extension FirstCreatePillViewController: ChoosePillButtonViewDelegate {
    
    func didSelectPillImage(with pillType: ChoosePillButtonView.PillType?) {
        guard let pillImage = pillType else {
            self.selectedImage = nil
            return
            
        }
        self.selectedImage = pillImage
    }
}
