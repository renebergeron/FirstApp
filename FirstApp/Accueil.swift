//
//  Accueil.swift
//  FirstApp
//
//  Created by Rene on 02/11/2016.
//  Copyright © 2016 Rene. All rights reserved.
//

import UIKit

class Acccueil: UIViewController {
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        // TODO 
        navigationController?.navigationBar.tintColor = UIColor.green
        
        
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.red]
        
        navigationController?.navigationBar.barTintColor = UIColor.yellow

        
        // On change bouton back ici sinon il est instancié sur la page accueil avec le libelle de la nav barre
        navigationItem.backBarButtonItem = UIBarButtonItem(title:"Maison", style: .plain, target:nil, action:nil)

    }
    
    
    @IBAction func clickSourceButton(sender : UIButton) {
        
        let storyboard = UIStoryboard(name : "Main", bundle : nil)
        
        let controller = storyboard.instantiateViewController(withIdentifier: "Exercice") as! Exercice
        
        //controller.niveau = sender.tag
        controller.calcule = CalculExercice(difficulte: sender.tag)
        
        self.navigationController?.show(controller, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "What?????"
        navigationItem.backBarButtonItem = backItem
    }
    
}
