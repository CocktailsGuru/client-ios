//
//  BaseVCCocktails.swift
//  CG2
//
//  Created by Tomáš Dobrotka on 09/03/2018.
//  Copyright © 2018 Tomáš Dobrotka. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import Foundation

class BaseVCCocktails : ButtonBarPagerTabStripViewController{

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
        self.navigationItem.title = "Cocktails"

//        if navigationController != nil {
//            navigationItem.titleView = bigLabel
//            bigLabel.sizeToFit()
//        }
        // Do any additional setup after loading the view, typically from a nib.
    }


    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child_1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TableOne")
        let child_2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TableTwo")
        let child_3 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TableThree")
        let child_4 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TableTwo")
        let child_5 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TableOne")
        let child_6 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TableThree")
        let child_7 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TableOne")
        let child_8 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TableTwo")
        let child_9 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TableOne")
        let child_10 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TableThree")

        return [child_1,child_2, child_3,child_4, child_5,child_6,child_7,child_8,child_9,child_10]
    }

    func loadDesign(){

        self.settings.style.selectedBarHeight = 1
        self.settings.style.selectedBarBackgroundColor = UIColor.black
        //self.settings.style.buttonBarBackgroundColor = UIColor(red: 222/256, green: 65/255, blue: 27/255, alpha: 1.0)
        //self.settings.style.buttonBarItemBackgroundColor = UIColor(red: 222/256, green: 65/255, blue: 27/255, alpha: 1.0)
        self.settings.style.buttonBarBackgroundColor = UIColor(red: 32/256, green: 150/255, blue: 243/255, alpha: 1.0)                //background color
        self.settings.style.buttonBarItemBackgroundColor = UIColor(red: 32/256, green: 150/255, blue: 243/255, alpha: 1.0) //items background color
        self.settings.style.selectedBarBackgroundColor = .white
        self.settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 13)
        self.settings.style.selectedBarHeight = 3.0                         //line heigt
        self.settings.style.buttonBarMinimumLineSpacing = 15                //spacing between items
        self.settings.style.buttonBarItemTitleColor = .white
        self.settings.style.buttonBarItemsShouldFillAvailableWidth = true
        self.settings.style.buttonBarLeftContentInset = 10
        self.settings.style.buttonBarRightContentInset = 10
        self.settings.style.buttonBarHeight = 32
        
        
//        self.settings.style.buttonBarBackgroundColor = UIColor.black
//        // buttonBar minimumInteritemSpacing value, note that button bar extends from UICollectionView
//        self.settings.style.buttonBarMinimumInteritem = 2.0
//        // buttonBar minimumLineSpacing value
//        self.settings.style.buttonBarMinimumLineSpacing: CGFloat?
//        // buttonBar flow layout left content inset value
//        self.settings.style.buttonBarLeftContentInset: CGFloat?
//        // buttonBar flow layout right content inset value
//        self.settings.style.buttonBarRightContentInset: CGFloat?
//
//        // selected bar view is created programmatically so it's important to set up the following 2 properties properly
//        self.settings.style.selectedBarBackgroundColor = UIColor.blackColor()
//        self.settings.style.selectedBarHeight: CGFloat = 5
//
//        // each buttonBar item is a UICollectionView cell of type ButtonBarViewCell
//        self.settings.style.buttonBarItemBackgroundColor: UIColor?
//        self.settings.style.buttonBarItemFont = UIFont.systemFontOfSize(18)
//        // helps to determine the cell width, it represent the space before and after the title label
//        self.settings.style.buttonBarItemLeftRightMargin: CGFloat = 8
//        self.settings.style.buttonBarItemTitleColor: UIColor?
//        // in case the barView items do not fill the screen width this property stretch the cells to fill the screen
//        self.settings.style.buttonBarItemsShouldFillAvailiableWidth = true
//        // only used if button bar is created programmatically and not using storyboards or nib files as recommended.
//        public var buttonBarHeight: CGFloat?
//


        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = UIColor.white    //text
            newCell?.label.textColor = UIColor.white    //selected text

        }
    }
}

