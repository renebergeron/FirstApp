//
//  Navigateur.swift
//  FirstApp
//
//  Created by Rene on 07/11/2016.
//  Copyright © 2016 Rene. All rights reserved.
//

import UIKit

class Navigateur : UIViewController, UISearchBarDelegate, UIWebViewDelegate {
    
    @IBOutlet var webViewer : UIWebView!
    @IBOutlet var searchBar : UISearchBar!
    
    var searchEngine = "Google"
    
    override func viewDidLoad() {
        //let url = URL(string: "http://pagesjuanes.fr")
        let url = URL(string: "https://www.openclassrooms.com")
        
        let req = URLRequest(url: url!)
        
        webViewer.loadRequest(req)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            if let url = URL(string: text) {
             
                let req = URLRequest(url: url)
                webViewer.loadRequest(req)
            } else {
                if searchEngine == "Google" {
                    let recGoogle = text.replacingOccurrences(of: " ", with: "+")
                    
                    let urlRechGoogle = URL(fileURLWithPath: "http://www.google.com/#q=\(recGoogle)")
                    
                    let req = URLRequest(url: urlRechGoogle)
                    
                    webViewer.loadRequest(req)
                } else if searchEngine == "Yahoo" {
                    let recYahoo = text.replacingOccurrences(of: " ", with: "+")
                    
                    let urlRechYahoo = URL(fileURLWithPath: "http://www.yahoo.com/search?p=\(recYahoo)")
                    
                    let req = URLRequest(url: urlRechYahoo)
                    
                    webViewer.loadRequest(req)
                    
                }
            }
            
        }
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        if let dochtml = webViewer.stringByEvaluatingJavaScript(from: "document.documentElement.outerHTML"){
                colorTopBar(htmlString: dochtml)
        }
    }
    
    func colorTopBar(htmlString : String) {
        
        let scanner = Scanner(string : htmlString)
        
        if scanner.scanUpTo("<meta name=\"theme-color\" content=\"#", into: nil) {
        
            scanner.scanString("<meta name=\"theme-color\" content=\"#", into: nil)
            
            var themeColor : NSString?
            
            if scanner.scanUpTo("\"", into: &themeColor) {
                print("*********************** la valeur de la couleur => \(themeColor!)")
                
                var themeInt : UInt32 = 0
                
                Scanner(string: themeColor as! String).scanHexInt32(&themeInt)
                
                let rouge = CGFloat((themeInt & 0xFF0000) >> 16) / 255.0
                let vert = CGFloat((themeInt & 0x00FF00) >> 8) / 255.0
                let bleu = CGFloat((themeInt & 0x0000FF)) / 255.0
                let color = UIColor(red: rouge, green: vert, blue: bleu, alpha: 1.0)
                
                UIView.animate(withDuration: TimeInterval(nan: Double.RawSignificand(0.5), signaling: true), animations: {
                    self.navigationController?.navigationBar.barTintColor = color
                })
            }
        }
    }
    
    @IBAction func goback(sender : UIBarButtonItem) {
        if webViewer.canGoBack {
            webViewer.goBack()
        }
    }
    
    @IBAction func goforward(sender : UIBarButtonItem){
        if webViewer.canGoForward {
            webViewer.goForward()
        }
    }
}
