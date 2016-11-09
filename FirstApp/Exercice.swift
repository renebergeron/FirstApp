//
//  ViewController.swift
//  FirstApp
//
//  Created by Rene on 25/10/2016.
//  Copyright © 2016 Rene. All rights reserved.
//

import UIKit


class Exercice : UIViewController, UITextFieldDelegate {

    @IBOutlet var enteredNumber : UITextField!
    @IBOutlet var buttonAnswer : UIButton!
    @IBOutlet var sliderButton : UISlider!
    @IBOutlet var stepperButton : UIStepper!
    @IBOutlet var viewTestPinchgesture : UIView!
    
    @IBOutlet var lTitle : UILabel!
    @IBOutlet var lConsigne : UILabel!
    
    var autoState = false
    
    var calcule : CalculExercice!
    
    //var niveau : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lTitle.text = "\(calcule.titre)"
        lConsigne.text = "\(calcule.consigne) = ?"
        
        enteredNumber.text = "\(calcule.reponse)"
        
        stepperButton.value = Double(calcule.reponse)
        sliderButton.setValue(Float(calcule.reponse), animated: true)
        
        enteredNumber.delegate = self
        
        viewTestPinchgesture.addGestureRecognizer(UILongPressGestureRecognizer(target : self, action :#selector(longSliderClick)))
        
        viewTestPinchgesture.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(slideAndDropMove)))
        
        viewTestPinchgesture.addGestureRecognizer(UIPinchGestureRecognizer(target: self, action: #selector(pinchDetected)))
    
        let img = UIImage(named: "help")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: img, style: .plain, target: self, action: #selector(onFaitquelqueChose))
    }

    func onFaitquelqueChose(sender : UIBarButtonItem) {
        print("On fait bien quelques chose!!!")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clickAction(sender : UIButton) {

        if let result = enteredNumber.text, result != "" {
            if Int(result) == calcule.reponse {
                alert(title: "Excelent", message: "\(calcule.reponse) est bien le resultat!")
            } else {
                alert(title: "Looser", message: "Mauvaise reponse")
            }
        }
        else {
            alert(title: "Champ vide", message: "Entrez une valeur")
        }
        
    }
    
    
    @IBAction func switchSate(sender : UISwitch) {
        autoState = sender.isOn
        print("On a bien \(autoState) dans la fonction")
        buttonAnswer.isHidden = autoState
    }
    
    @IBAction func textModified(sender  : UITextField) {
        if !autoState {
            if let result = sender.text, result != ""{
                if let integer = Int(result) {
                    if integer > 99 {
                        sender.text = "99"
                    }
                    print("et alors => \(result)")
                    sliderButton.setValue(Float(result)!, animated: true)
                    stepperButton.value = Double(result)!
                }
            }
        }
    }
    
    @IBAction func sliderMoved(sender : UISlider) {
        let valTemp = Int(sender.value)

        enteredNumber.text = "\(valTemp)"
        
        stepperButton.value = Double(valTemp)

    }
    
    @IBAction func stepperHit(sender : UIStepper) {
        
        let value = Int(sender.value)
        
        enteredNumber.text = "\(value)"
        
        sliderButton.setValue(Float(value), animated: true)
        
    }
    
    func textFieldShouldReturn(_ sender: UITextField) -> Bool {
        if autoState {
            if let result = sender.text, result != ""{
                if Int(result) == 8 {
                    alert(title: "Bravo", message: "Bravo champion!")
                } else {
                    alert(title: "Pas la bonne valeur", message: "Mauvais choix => \(result)")
                    
                }
            }
        }
        return true
    }
    
    func longSliderClick(sender : UILongPressGestureRecognizer){
        alert(title: "It tickle!", message: "Stop tickling me!!!")
    }

    func slideAndDropMove(sender : UIPanGestureRecognizer) {
        let step = sender.view!
        let coordinateTouch = sender.location(in: self.view)
        
        print("on est là => \(coordinateTouch)")
        step.center = coordinateTouch
        
    }
    
    func pinchDetected(sender : UIPinchGestureRecognizer) {
        alert(title: "Ca pince", message: "Ouaaaa ca fait mal")
    }
    

    func alert(title : String, message : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

