//
//  VictoryView.swift
//  FirstApp
//
//  Created by Rene on 09/11/2016.
//  Copyright © 2016 Rene. All rights reserved.
//

import UIKit

class VictoryView : UIView {
  
    init() {
        let screenWidth = UIScreen.main.bounds.width, screenHeight = UIScreen.main.bounds.height

        super.init(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        
        
        let tabPoints = [
            CGPoint(x: 0.3945 * screenWidth, y: 0.2588 * screenHeight), //Point A
            CGPoint(x: 0.5028 * screenWidth, y: 0.3447 * screenHeight), //Point B
            CGPoint(x: 0.5651 * screenWidth, y: 0.2435 * screenHeight), //Point C
            CGPoint(x: 0.6220 * screenWidth, y: 0.3529 * screenHeight), //Point D
            CGPoint(x: 0.7761 * screenWidth, y: 0.2494 * screenHeight), //Point E
            CGPoint(x: 0.6660 * screenWidth, y: 0.4094 * screenHeight), //Point F
            CGPoint(x: 0.9174 * screenWidth, y: 0.4565 * screenHeight), //Point G
            CGPoint(x: 0.6477 * screenWidth, y: 0.4929 * screenHeight), //Point H
            CGPoint(x: 0.7046 * screenWidth, y: 0.6224 * screenHeight), //Point I
            CGPoint(x: 0.5394 * screenWidth, y: 0.5212 * screenHeight), //Point J
            CGPoint(x: 0.4092 * screenWidth, y: 0.6647 * screenHeight), //Point K
            CGPoint(x: 0.3615 * screenWidth, y: 0.5141 * screenHeight), //Point L
            CGPoint(x: 0.1174 * screenWidth, y: 0.5424 * screenHeight), //Point M
            CGPoint(x: 0.3229 * screenWidth, y: 0.4165 * screenHeight), //Point N
            CGPoint(x: 0.0881 * screenWidth, y: 0.3212 * screenHeight), //Point O
            CGPoint(x: 0.3927 * screenWidth, y: 0.3541 * screenHeight),  //Point P
            CGPoint(x: 0.3945 * screenWidth, y: 0.2588 * screenHeight), //Point A
            CGPoint(x: 0.5028 * screenWidth, y: 0.3447 * screenHeight)//Et on termine au point B
        ]
        
        let path = CGMutablePath()
        
        path.move(to: tabPoints[0])
        path.addLines(between: tabPoints)

        let layer = CAShapeLayer()
        layer.fillColor = UIColor.white.cgColor
        layer.path = path
        layer.position = CGPoint(x: 0, y: 0)
        layer.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        layer.strokeColor = UIColor.purple.cgColor
        layer.lineWidth = 4
        
        let label = UILabel()
        
        label.text = "BRAVO !!!"
        
        label.font = UIFont(name: "KaushanScript-Regular", size: 25)
        label.sizeToFit()
        label.frame.origin.y = 0.4112 * screenHeight
        label.center.x = self.center.x
        
        label.textColor = UIColor.purple
        
        
        self.layer.addSublayer(layer)
        
        addSubview(label)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: TimeInterval(0.5), animations: { self.alpha = 0}, completion: {_ in self.removeFromSuperview(); print("On vien tout juste de supprimer vue"); return})
    }
    
    
    
    
}
