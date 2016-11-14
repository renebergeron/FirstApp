//
//  Login.swift
//  FirstApp
//
//  Created by Rene on 14/11/2016.
//  Copyright © 2016 Rene. All rights reserved.
//

import UIKit
import FBSDKLoginKit


class Login : UIViewController, FBSDKLoginButtonDelegate {
    
    override func viewDidLoad() {
        let button = FBSDKLoginButton()
        
        button.center = self.view.center
        
        button.delegate = self
        
        button.readPermissions = ["public_profile", "email"]
        
        self.view.addSubview(button)
    }
    
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        //
    }

    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print(error)
        } else {
            if result.isCancelled {
                print("La connection a été cancelé")
            } else {
                
                if result.grantedPermissions.contains("email") {
                    print("L'utilisateur utilise sn compte facebook pour se connecter")
                    
                    
                    let grapheRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "email"])
                    
                    grapheRequest?.start(completionHandler:  {(connexion, result, error) -> Void in
                        if error == nil && connexion != nil{
                            if let resultAsDico = result as? Dictionary<String, String> , let userEmail = resultAsDico["email"] {
                                print("Son email est : \(userEmail)")
                            }
                        }
                    })
                }
                
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
                let nav = storyboard.instantiateViewController(withIdentifier: "nav") as! UINavigationController
                
                present(nav, animated: true, completion: nil)
            }
        }
    }
}
