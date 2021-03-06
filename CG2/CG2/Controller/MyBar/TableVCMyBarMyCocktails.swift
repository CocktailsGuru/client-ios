//
//  TableVCMyBarMyCocktails.swift
//  CG2
//
//  Created by Tomáš Dobrotka on 22/03/2018.
//  Copyright © 2018 Tomáš Dobrotka. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TableVCMyBarMyCocktails: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellOne", for: indexPath) as! TableViewCellMyBarMyCocktails
        
        return cell
    }
    
    
}

extension TableVCMyBarMyCocktails : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "MY COCKTAILS")
    }
}

