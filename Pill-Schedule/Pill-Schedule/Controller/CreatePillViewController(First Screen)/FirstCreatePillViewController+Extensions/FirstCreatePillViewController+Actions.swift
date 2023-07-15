//
//  FirstCreatePillViewController+Actions.swift
//  Pills
//
//  Created by Nikita  on 4/6/23.
//

import Foundation
import UIKit

extension FirstCreatePillViewController{
    
    @objc func didTapBackButton(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func didTapContinueButton() {
        let vc = SecondCreatePillViewController()
        guard let name = pillName else {return}
        guard let image = selectedImage else {return}
        guard let dose = pillDose else {return}
        let description = dose.lowercased() + " " + selectedTimestamp.lowercased()
        let pill = Pill()
        pill.name = name
        pill.pillDescription = description
        pill.imageName = image.imageDescription
        print(pill.imageName)
        print(pill.name)
        print(pill.pillDescription)
        vc.pill = pill
       
        navigationController?.pushViewController(vc, animated: true)

    }
    
    @objc func pillNameTextFieldChanged(_ sender: UITextField) {
        let text = sender.text?.trimmingCharacters(in: .whitespaces)
        self.pillName = text
    }
    
    @objc func pillDoseTextFieldChanged(_ sender: UITextField) {
        let text = sender.text?.trimmingCharacters(in: .whitespaces)
        self.pillDose = text
    }
    
    func checkAllFields() {
        guard let image = self.selectedImage else {
            continueButton.isDisabled = true
            return
        }
        guard let name = self.pillName  else {
            continueButton.isDisabled = true
            return
        }
        guard name != ""  else {
            continueButton.isDisabled = true
            return
        }
        
        guard let dose = self.pillDose else {
            continueButton.isDisabled = true
            return
        }
        guard dose != "" else {
            continueButton.isDisabled = true
            return
        }
        
        continueButton.isDisabled = false
    }
}
