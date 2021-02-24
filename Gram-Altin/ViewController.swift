//
//  ViewController.swift
//  Gram-Altin
//
//  Created by M. Raşit Öner on 27.07.2020.
//  Copyright © 2020 M. Raşit Öner. All rights reserved.
//

import UIKit
import Foundation
import WebKit



class ViewController: UIViewController, UpdatingProtocol, WKUIDelegate  {
    
    func update(_ goldObject: myGold) {
        DispatchQueue.main.async {
            self.priceLabel.text = goldObject.buy 
            
        }
    }

    var fetching = getData()
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var myButton: UIButton!
    
    @IBAction func refreshTapped(_ sender: UIButton) {
        fetching.getIt()
    }
    
  var webView: WKWebView!
    
    override func viewWillAppear(_ animated: Bool) {
        myButton.imageView?.layer.cornerRadius = 10
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        fetching.delegate = self
        fetching.getIt()
        webView = WKWebView(frame: CGRect(x: 0, y: self.view.frame.height-550, width: self.view.frame.width, height: 550), configuration: WKWebViewConfiguration())

        self.view.addSubview(webView)
        let myURL = URL(string:"https://www.tradingview.com/chart/?symbol=FX_IDC%3AXAUTRYG")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
    }
}



