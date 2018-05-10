//
//  VCProfileIntro.swift
//  CG2
//
//  Created by Tomáš Dobrotka on 23/03/2018.
//  Copyright © 2018 Tomáš Dobrotka. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class VCProfileIntro: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

extension VCProfileIntro : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "INTRO")
    }
    
}
