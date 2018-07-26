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
    
    func configureCell( ingredientNonAlcoDetailMyBarStructs: IngredientDetailMyBarStruct) {

        let nameText = ingredientNonAlcoDetailMyBarStructs.name ?? ""
        nameLbl.text = nameText.capitalized
        let imgText = ingredientNonAlcoDetailMyBarStructs.imageName ?? "1.jpg"
        idImg.image = UIImage(named: "\(imgText)")
        //print(imgText)
        //print("\(INGREDIENTIMG)\(imgText)")
        //idImg.image = UIImage(named: "\(INGREDIENTIMG)\(imgText)")      //it will be good, after downloading images to device...maybe
        //idImg.image = UIImage(named: "\(imgText)")
        
    }
    
    

}

