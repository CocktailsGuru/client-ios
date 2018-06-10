//
//  TableViewCellMyBarMyBar.swift
//  CG2
//
//  Created by Tomáš Dobrotka on 22/03/2018.
//  Copyright © 2018 Tomáš Dobrotka. All rights reserved.
//

import UIKit

class TableViewCellMyBarMyBar: UITableViewCell {
    
   
    @IBOutlet weak var myBarMyBarItemImg: UIImageView!
    
    @IBOutlet weak var myBarMyBarItemLbl: UILabel!
    
    
    @IBOutlet weak var myBarMyBarItemSwitchBtn: UISwitch!
    
    @IBAction func myBarMyBarItemSwitch(_ sender: UISwitch) {
        
    }
    
    var myBarMyBarItemSwitchStatus: Bool!
    
    func configureCell(img: String, name: String, switchBool: Bool) {
        self.myBarMyBarItemImg.image = UIImage(named: img)
        self.myBarMyBarItemLbl.text = name
        self.myBarMyBarItemSwitchStatus = switchBool
        self.myBarMyBarItemSwitchBtn.isOn = true        //always true
        
    }
    
}
