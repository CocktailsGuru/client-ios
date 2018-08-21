//
//  MyBarAlcoholicCell.swift
//  CG
//
//  Created by Tomáš Dobrotka on 23/03/2018.
//  Copyright © 2018 Tomáš Dobrotka. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

var lastTag = -1

class MyBarAlcoholicCell: UICollectionViewCell {
    
    @IBOutlet weak var idImg : UIImageView!
    @IBOutlet weak var nameLbl : UILabel!
    @IBOutlet var ratingStarBtns: [UIButton]!
    
    
    
    func configureCell( ingredientAlcoDetailMyBarStructs: IngredientDetailMyBarStruct, img : String) {
        print("HALLLO: ",img)
        let nameText = ingredientAlcoDetailMyBarStructs.name ?? ""
        nameLbl.text = nameText.capitalized
//        let imgText = ingredientAlcoDetailMyBarStructs.imageName ?? "1.jpg"
//        idImg.image = UIImage(named: "\(imgText)")
        
        
//        IngredientService.instance.findIngredientCollectionImage(imageName: "\(img)"){ (success) in
//
//
////            print("kk \(mainImag)")
////            self.imagg = mainImag
//
//            if success {
//                print("SUCCESS IMAGES")
//                self.idImg.image = UIImage(named: "\(imageName)")
//            }else{
//                self.idImg.image = UIImage(named: "2.jpg")
//                print("not success")
//            }
//
//        }
        
        
        //TODO unexpcted found nil while unwraping optional value : Thread 1: Fatal error: Unexpectedly found nil while unwrapping an Optional value
        //passwords, usernames, login
        let user = "=="
        let password = "=="
        let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers = ["Authorization": "Basic \(base64Credentials)"]
        
        let BIG_INGREDIENT_IMAGE : String = "\(INGREDIENTIMG)\(img)"
        
        print("ee: \(BIG_INGREDIENT_IMAGE)")
        
        //var imag = UIImage(named : "absinthe")
        
        Alamofire.request(BIG_INGREDIENT_IMAGE, method: .get, parameters: nil, encoding: JSONEncoding.default, headers:headers) .validate().responseImage { response in
            //print(response)
            var helpImg : UIImage
            helpImg = response.result.value!
            //print("KKKKK: ",helpImg)
            self.idImg.image = helpImg
            print("tt: ",self.idImg.image.debugDescription)

            
        }
        
        
        
        
//
//        let imgText = img ?? "1.jpg"
//        idImg.image = UIImage(named: "\(imgText)")
        
    }
    
    
//    ///////////////
//    //
//    // OLD
//    //
//    ///////////////
//
//
//    //var lastTag = -1
//
//    @IBAction func ratingStarBtnTapped(_ sender: UIButton) {
//        var tag = sender.tag
//        //print("AAAAA: ", tag, " AAAAA")
//
//        if (tag == 1 ) && (lastTag != 0){      //maybe it's good
//            tag = 0
//            lastTag = 0
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
//        lastTag = tag
//    }
//
//    //@IBOutlet weak var ratingLbl : UILabel!
//
//    var myBarAlcoholicItem : MyBarAlcoholicItem!
//
//    func configureCell( myBarAlcoholicItem: MyBarAlcoholicItem) {
//        self.myBarAlcoholicItem = myBarAlcoholicItem
// //       idImg.image = UIImage(named: "2")
//       // print(self.myBarAlcoholicItem.image)
//        idImg.image = UIImage(named: self.myBarAlcoholicItem.image)
//        nameLbl.text = self.myBarAlcoholicItem.name.capitalized
//        var tag = self.myBarAlcoholicItem.rating
//       // let tag = 2
//
//        if (tag == 1 ) && (lastTag != 0){      //maybe it's good
//            tag = 0
//            lastTag = 0
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
//        lastTag = tag
//    }
//
//    ///////////////
//    //
//    // OLD
//    //
//    ///////////////
//
    
}


