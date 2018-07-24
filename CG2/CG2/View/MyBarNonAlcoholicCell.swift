//
//  MyBarNonAlcoholicCell.swift
//  CG2
//
//  Created by Tomáš Dobrotka on 24/07/2018.
//  Copyright © 2018 Tomáš Dobrotka. All rights reserved.
//

import UIKit

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
    
    
    
    
    
//    var myBarAlcoholicItem : MyBarAlcoholicItem!
 //   var ingredientDetailMyBarStruct : IngredientDetailMyBarStruct!
    
    
    
    
//    func configureCell( myBarAlcoholicItem: MyBarAlcoholicItem) {
//
//        self.myBarAlcoholicItem = myBarAlcoholicItem
//        idImg.image = UIImage(named: self.myBarAlcoholicItem.image)
//        nameLbl.text = self.myBarAlcoholicItem.name.capitalized
    
    func configureCell( ingredientDetailMyBarStruct: IngredientDetailMyBarStruct) {
        
        //self.ingredientDetailMyBarStruct = ingredientDetailMyBarStruct
                //   idImg.image = UIImage(named: "2")
                //   nameLbl.text = "what"
                // print(self.myBarAlcoholicItem.image)
                //  idImg.image = UIImage(named: self.mBADItem.image)
        
        let nameText = ingredientDetailMyBarStruct.name ?? ""
        nameLbl.text = nameText.capitalized
        
        idImg.image = UIImage(named: "2")
        
        print("IMAGE: ",idImg)
        print("TEXT: ",nameText.capitalized)
        
        
        
        
        

            }
    
    

    }
    
    
    //    var ingredientDetailMyBarStruct : IngredientDetailMyBarStruct!
    //
    //    func configureCell( ingredientDetailMyBarStruct: IngredientDetailMyBarStruct) {
    //        print("latat")
    ////        self.ingredientDetailMyBarStruct = ingredientDetailMyBarStruct
    //        //   idImg.image = UIImage(named: "2")
    //        //   nameLbl.text = "what"
    //        // print(self.myBarAlcoholicItem.image)
    //        //  idImg.image = UIImage(named: self.mBADItem.image)
    //        nameLbl.text = ingredientDetailMyBarStruct.name.capitalized
    //        //      var tag = self.mBADItem.rating
    //        // let tag = 2
    //
    //        //            if (tag == 1 ) && (lastTag2 != 0){      //maybe it's good
    //        //                tag = 0
    //        //                lastTag2 = 0
    //        //            }
    //        //
    //        //            for button in ratingStarBtns {
    //        //                if button.tag <= tag {
    //        //                    //selected
    //        //                    button.setTitle("★", for: .normal)
    //        //                }else {
    //        //                    button.setTitle("☆", for: .normal)
    //        //                }
    //        //            }
    //        //            lastTag2 = tag
    //                }
    //
    
    
//}


