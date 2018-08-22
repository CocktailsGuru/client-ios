//
//  TableViewCellMyBarShoppingList.swift
//  CG2
//
//  Created by Tomáš Dobrotka on 22/03/2018.
//  Copyright © 2018 Tomáš Dobrotka. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class TableViewCellMyBarShoppingList: UITableViewCell {
   
    
    @IBOutlet weak var myBarShoppingListItemImg: UIImageView!
    
    @IBOutlet weak var myBarShoppingListItemLbl: UILabel!
    
    
    @IBOutlet weak var myBarShoppingListItemSwitchBtn: UISwitch!
    
    @IBAction func myBarShoppingListItemSwitch(_ sender: UISwitch) {
        
    }
    
    var myBarShoppingListItemSwitchStatus: Bool!
    
    func configureCell(img: String, name: String, switchBool: Bool) {
        
        //TODO unexpcted found nil while unwraping optional value : Thread 1: Fatal error: Unexpectedly found nil while unwrapping an Optional value
        //passwords, usernames, login
        let user = "=="
        let password = "=="
        let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers = ["Authorization": "Basic \(base64Credentials)"]
        
        let SMALL_INGREDIENT_IMAGE : String = "\(INGREDIENTIMG)\(img)"
        
        print("ee: \(SMALL_INGREDIENT_IMAGE)")
        
        //var imag = UIImage(named : "absinthe")
        
        Alamofire.request(SMALL_INGREDIENT_IMAGE, method: .get, parameters: nil, encoding: JSONEncoding.default, headers:headers) .validate().responseImage { response in
            
            var helpImg = UIImage(named: "1.png")   // TODO : after deleting local images, add 1.png
            if response.result.value != nil {
                helpImg = response.result.value!
            }else{
                print("Doesn’t contain a value.")
            }
            
            self.myBarShoppingListItemImg.image = helpImg
            print("tt: ",self.myBarShoppingListItemImg.image.debugDescription)
            
        }
        
        
        //self.myBarShoppingListItemImg.image = UIImage(named: img)
        self.myBarShoppingListItemLbl.text = name
        self.myBarShoppingListItemSwitchStatus = switchBool
        self.myBarShoppingListItemSwitchBtn.isOn = true        //always true
        
    }
    
}
