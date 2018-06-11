//
//  TableViewCellMyBarShoppingList.swift
//  CG2
//
//  Created by Tomáš Dobrotka on 22/03/2018.
//  Copyright © 2018 Tomáš Dobrotka. All rights reserved.
//

import UIKit

class TableViewCellMyBarShoppingList: UITableViewCell {
   
    
    @IBOutlet weak var myBarShoppingListItemImg: UIImageView!
    
    @IBOutlet weak var myBarShoppingListItemLbl: UILabel!
    
    
    @IBOutlet weak var myBarShoppingListItemSwitchBtn: UISwitch!
    
    @IBAction func myBarShoppingListItemSwitch(_ sender: UISwitch) {
        
    }
    
    var myBarShoppingListItemSwitchStatus: Bool!
    
    func configureCell(img: String, name: String, switchBool: Bool) {
        self.myBarShoppingListItemImg.image = UIImage(named: img)
        self.myBarShoppingListItemLbl.text = name
        self.myBarShoppingListItemSwitchStatus = switchBool
        self.myBarShoppingListItemSwitchBtn.isOn = true        //always true
        
    }
    
}
