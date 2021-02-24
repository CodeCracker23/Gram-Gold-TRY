//
//  FetchRequest.swift
//  Gram-Altin
//
//  Created by M. Raşit Öner on 29.07.2020.
//  Copyright © 2020 M. Raşit Öner. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol UpdatingProtocol {
    func update(_ goldObject: myGold)
}

struct getData {
    
    var delegate: UpdatingProtocol? = nil
    
    
    init() {
    }
    
    func getIt() {
        
        
        let headers: HTTPHeaders  = [
            "content-type": "application/json",
            "authorization": "apikey 1sEyJkFSusdsDmDpGroAlJ:1LnU1FNN1A9ILPDv40peq1"
        ]
        
        AF.request("https://api.collectapi.com/economy/goldPrice", headers: headers).responseJSON { response in
            
            let result = response.data
            if result != nil {
                let json = JSON(result!)
                let price1 = json["result"][0]["buyingstr"].stringValue.dropLast()
                let price = price1 + "₺"
                if price != "₺" {
                let gold = myGold(buy: String(price))
                    self.delegate?.update(gold)

                } else {
                    self.delegate?.update(myGold(buy: "Gram Altın"))
                }
                
                
                
                
            }
        }
    }
}
