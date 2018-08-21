//
//  MyBarNonAlcoholicCell.swift
//  CG2
//
//  Created by Tomáš Dobrotka on 24/07/2018.
//  Copyright © 2018 Tomáš Dobrotka. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

var lastTag2 = -1

class MyBarNonAlcoholicCell: UICollectionViewCell {
    
    @IBOutlet weak var idImg : UIImageView!
    @IBOutlet weak var nameLbl : UILabel!
    @IBOutlet var ratingStarBtns: [UIButton]!       //not connected

    //var lastTag2 = -1
    
//    @IBAction func ratingStarBtnTapped(_ sender: UIButton) {
//
//    var tag = sender.tag
//        //print("AAAAA: ", tag, " AAAAA")
//
//        if (tag == 1 ) && (lastTag2 != 0){      //maybe it's good
//            tag = 0
//            lastTag2 = 0
//        }
//
//        for button in ratingStarBtns {
//            if button.tag <= tag {
//                //selected
//                button.setTitle("★", for: .normal)
//            }else {
//                button.setTitle("☆", for: .normal)
//            }
//        }
//        lastTag2 = tag
//    }

    
    //@IBOutlet weak var ratingLbl : UILabel!
    
    func configureCell( ingredientNonAlcoDetailMyBarStructs: IngredientDetailMyBarStruct, img : String) {

        let nameText = ingredientNonAlcoDetailMyBarStructs.name ?? ""
        nameLbl.text = nameText.capitalized
        
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
            self.idImg.image = helpImg
            print("tt: ",self.idImg.image.debugDescription)
            
            
        }
        
        
        
        
        
//
//        let imgText = ingredientNonAlcoDetailMyBarStructs.imageName ?? "1.jpg"
//        idImg.image = UIImage(named: "\(imgText)")
        
        
        
       // idImg.image = ingredientNonAlcoDetailMyBarStructs.imag
        
        //print(imgText)
        //print("\(INGREDIENTIMG)\(imgText)")
        //idImg.image = UIImage(named: "\(INGREDIENTIMG)\(imgText)")      //it will be good, after downloading images to device...maybe
        //idImg.image = UIImage(named: "\(imgText)")
        
    }
    
    

}

