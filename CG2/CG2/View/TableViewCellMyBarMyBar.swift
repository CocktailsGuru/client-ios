//
//  TableViewCellMyBarMyBar.swift
//  CG2
//
//  Created by Tomáš Dobrotka on 22/03/2018.
//  Copyright © 2018 Tomáš Dobrotka. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class TableViewCellMyBarMyBar: UITableViewCell {
    
   
    @IBOutlet weak var myBarMyBarItemImg: UIImageView!
    
    @IBOutlet weak var myBarMyBarItemLbl: UILabel!
    
    
    @IBOutlet weak var myBarMyBarItemSwitchBtn: UISwitch!
    
    @IBAction func myBarMyBarItemSwitch(_ sender: UISwitch) {
        
    }
    
    var myBarMyBarItemSwitchStatus: Bool!
    
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
            //print(response)
            var helpImg : UIImage
            helpImg = response.result.value!
            //print("KKKKK: ",helpImg)
            self.myBarMyBarItemImg.image = helpImg
            print("tt: ",self.myBarMyBarItemImg.image.debugDescription)
            
        }
        
        
        
        
        
        
        //self.myBarMyBarItemImg.image = UIImage(named: img)
        self.myBarMyBarItemLbl.text = name
        self.myBarMyBarItemSwitchStatus = switchBool
        self.myBarMyBarItemSwitchBtn.isOn = true        //always true
        
    }
    
}
