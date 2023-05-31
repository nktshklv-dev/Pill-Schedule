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
}
