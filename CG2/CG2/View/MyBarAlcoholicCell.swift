//
//  MyBarAlcoholicCell.swift
//  CG
//
//  Created by Tomáš Dobrotka on 23/03/2018.
//  Copyright © 2018 Tomáš Dobrotka. All rights reserved.
//

import UIKit

var lastTag = -1

class MyBarAlcoholicCell: UICollectionViewCell {
    
    @IBOutlet weak var idImg : UIImageView!
    @IBOutlet weak var nameLbl : UILabel!
    @IBOutlet var ratingStarBtns: [UIButton]!
    
    //var lastTag = -1
    
    @IBAction func ratingStarBtnTapped(_ sender: UIButton) {
        var tag = sender.tag
        //print("AAAAA: ", tag, " AAAAA")

        if (tag == 1 ) && (lastTag != 0){      //maybe it's good
            tag = 0
            lastTag = 0
        }

        for button in ratingStarBtns {
            if button.tag <= tag {
                //selected
                button.setTitle("★", for: .normal)
            }else {
                button.setTitle("☆", for: .normal)
            }
        }
        lastTag = tag
    }

    //@IBOutlet weak var ratingLbl : UILabel!

    var myBarAlcoholicItem : MyBarAlcoholicItem!

    func configureCell( myBarAlcoholicItem: MyBarAlcoholicItem) {
        self.myBarAlcoholicItem = myBarAlcoholicItem
 //       idImg.image = UIImage(named: "2")
       // print(self.myBarAlcoholicItem.image)
        idImg.image = UIImage(named: self.myBarAlcoholicItem.image)
        nameLbl.text = self.myBarAlcoholicItem.name.capitalized
        var tag = self.myBarAlcoholicItem.rating
       // let tag = 2

        if (tag == 1 ) && (lastTag != 0){      //maybe it's good
            tag = 0
            lastTag = 0
        }

        for button in ratingStarBtns {
            if button.tag <= tag {
                //selected
                button.setTitle("★", for: .normal)
            }else {
                button.setTitle("☆", for: .normal)
            }
        }
        lastTag = tag
    }
    
    
}


