//
//  CalculExercie.swift
//  FirstApp
//
//  Created by Rene on 04/11/2016.
//  Copyright © 2016 Rene. All rights reserved.
//

import Foundation


class CalculExercice  {
    var consigne : String
    var titre : String
    var reponse : Int
    
    init(difficulte : Int) {
        switch difficulte {
        case 2:
            consigne = "8 * 7"
            titre = "Niveau moyen"
            reponse = 56
            break
        default:
            consigne = "4 + 4"
            titre = "Niveau facile"
            reponse = 8
            break
        }
    }
}
