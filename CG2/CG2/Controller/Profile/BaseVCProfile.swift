//
//  BaseVCProfile.swift
//  CG2
//
//  Created by Tomáš Dobrotka on 23/03/2018.
//  Copyright © 2018 Tomáš Dobrotka. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import Foundation

class BaseVCProfile : ButtonBarPagerTabStripViewController{
    
    lazy var bigLabel: UILabel = {
        let bigLabel = UILabel()
        bigLabel.backgroundColor = .clear
        bigLabel.textColor = .white
        bigLabel.font = UIFont.boldSystemFont(ofSize: 20)
        bigLabel.adjustsFontSizeToFitWidth = true
        
        return bigLabel
    }()
    
    override func viewDidLoad() {
        self.loadDesign()
        super.viewDidLoad()
        self.navigationItem.title = "Profile"
        
        //        if navigationController != nil {
        //            navigationItem.titleView = bigLabel
        //            bigLabel.sizeToFit()
        //        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child_1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfileIntro")
        let child_2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfileAlcoholic")
//        let child_3 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MyBarMyBar")
//        let child_4 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MyBarShoppingList")
//        let child_5 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MyBarSuggestions")
//        let child_6 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MyBarAlcoholic")
//        let child_7 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MyBarNonAlcoholic")
        
        return [child_1, child_2]  //, child_3,child_4, child_5,child_6,child_7
    }
    
    func loadDesign(){
        
        self.settings.style.selectedBarHeight = 1
        self.settings.style.selectedBarBackgroundColor = UIColor.black
        self.settings.style.buttonBarBackgroundColor = UIColor(red: 32/256, green: 150/255, blue: 243/255, alpha: 1.0)                //background color
        self.settings.style.buttonBarItemBackgroundColor = UIColor(red: 32/256, green: 150/255, blue: 243/255, alpha: 1.0)            //items background color
        self.settings.style.selectedBarBackgroundColor = .white
        self.settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 13)
        self.settings.style.selectedBarHeight = 3.0                         //line heigt
        self.settings.style.buttonBarMinimumLineSpacing = 60                //spacing between items
        self.settings.style.buttonBarItemTitleColor = .white
        self.settings.style.buttonBarItemsShouldFillAvailableWidth = true
        self.settings.style.buttonBarLeftContentInset = 10      //spacing before first item
        self.settings.style.buttonBarRightContentInset = 10     //spacing after last item
        self.settings.style.buttonBarHeight = 32
        
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = UIColor.white    //text
            newCell?.label.textColor = UIColor.white    //selected text
            
        }
    }
}


