//
//  ProfileAlcoholicCell.swift
//  CG2
//
//  Created by Tomáš Dobrotka on 23/03/2018.
//  Copyright © 2018 Tomáš Dobrotka. All rights reserved.
//

import UIKit

class ProfileAlcoholicCell: UICollectionViewCell {
    
    @IBOutlet weak var idImg : UIImageView!
    @IBOutlet weak var nameLbl : UILabel!
    
    @IBOutlet var ratingStarBtns: [UIButton]!
    
    @IBAction func ratingStarBtnTapped(_ sender: UIButton) {
        let tag = sender.tag
        for button in ratingStarBtns {
            if button.tag <= tag {
                //selected
                button.setTitle("★", for: .normal)
            }else {
                button.setTitle("☆", for: .normal)
            }
        }
    }
    
    //@IBOutlet weak var ratingLbl : UILabel!
    
    var profileAlcoholicItem : ProfileAlcoholicItem!
    
    func configureCell( profileAlcoholicItem: ProfileAlcoholicItem) {
        self.profileAlcoholicItem = profileAlcoholicItem
        idImg.image = UIImage(named: "absinthe")
        nameLbl.text = self.profileAlcoholicItem.name.capitalized
    }
    
}

