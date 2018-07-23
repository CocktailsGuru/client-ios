//
//  MBADCell.swift
//  CG2
//
//  Created by Tomáš Dobrotka on 17/05/2018.
//  Copyright © 2018 Tomáš Dobrotka. All rights reserved.
//

import UIKit

var MBADlastTag = -1

class MBADCell: UICollectionViewCell {

    @IBOutlet weak var idImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet var ratingStarBtns: [UIButton]!
    
    @IBAction func ratingStarBtnTapped(_ sender: UIButton) {
        var tag = sender.tag
        //print("AAAAA: ", tag, " AAAAA")
        
        if (tag == 1 ) && (MBADlastTag != 0){      //maybe it's good
            tag = 0
            MBADlastTag = 0
        }
        
        for button in ratingStarBtns {
            if button.tag <= tag {
                //selected
                button.setTitle("★", for: .normal)
            }else {
                button.setTitle("☆", for: .normal)
            }
        }
        MBADlastTag = tag
    }
    
    var mBADItem : MBADItem!
    
    func configureCell( mBADItem: MBADItem) {
        self.mBADItem = mBADItem
     //   idImg.image = UIImage(named: "2")
     //   nameLbl.text = "what"
        // print(self.myBarAlcoholicItem.image)
        idImg.image = UIImage(named: self.mBADItem.image)
        nameLbl.text = self.mBADItem.name.capitalized
        var tag = self.mBADItem.rating
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


