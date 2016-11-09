//
//  CustomizedButton.swift
//  FirstApp
//
//  Created by Rene on 28/10/2016.
//  Copyright © 2016 Rene. All rights reserved.
//

import UIKit

class CustomizedButton : UIButton {

    required init?(coder aDecoder : NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 25
        
        layer.borderColor = UIColor.green.cgColor
        
        layer.borderWidth = 5
        
        setTitleColor(UIColor.brown, for: .normal)
        
        contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        
        
    }
    
}
