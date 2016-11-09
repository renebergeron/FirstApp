//
//  Paramatres.swift
//  FirstApp
//
//  Created by Rene on 07/11/2016.
//  Copyright © 2016 Rene. All rights reserved.
//

import UIKit

class Parametres : UIViewController, UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: .default, reuseIdentier : "Basic")
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Basic")
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "Contact ca"
                break
            case 1:
                cell.textLabel?.text = "Visite pagesjaunes..fr"
            default:
                break
            }
        case 1:
            cell.textLabel?.text = "Want more?"
            break
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Gettind some help"
        case 1:
            return "Information"
        default:
            return "cas pa default"
        }
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if indexPath.section == 1 {
            let vc = UIViewController()
            let lab = UILabel()
            lab.textColor = UIColor.brown
            lab.numberOfLines = 0
            lab.frame.size.width = 300
            lab.text = "Juste want to see !!!"
            lab.sizeToFit()
            lab.frame.origin = CGPoint(x: 15, y: 100)
            vc.view.addSubview(lab)
            vc.view.backgroundColor = UIColor.cyan
            navigationController?.pushViewController(vc, animated: true)
            
        } else {
            if indexPath.row == 0 {
            UIApplication.shared.open(NSURL(string : "https://openclassrooms.com/")! as URL)
            }
        }
    }
}
