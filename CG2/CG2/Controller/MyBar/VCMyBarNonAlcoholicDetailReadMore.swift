//
//  VCMyBarNonAlcoholicDetailReadMore.swift
//  CG2
//
//  Created by Tomáš Dobrotka on 01/08/2018.
//  Copyright © 2018 Tomáš Dobrotka. All rights reserved.
//

import UIKit

class VCMyBarNonAlcoholicDetailReadMore: UIViewController {
    
    
    @IBOutlet weak var VCMBNADRMMainImage: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    var text = ""
    var imageName = ""
 //   var myBarAlcoholicItem: MyBarAlcoholicItem!
 //   var ingredientDetail: IngredientDetail!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationController?.hidesBarsOnSwipe = true
        //self.tabBarController?.tabBar.isHidden = true
        
        //self.title = myBarAlcoholicItem.name
        //self.VCMBNADRMMainImage.image = UIImage(named: "\(imageName)")
        self.VCMBNADRMMainImage.image = mainImag
        
        self.textLabel.text = text
        
    }
    
    
}
