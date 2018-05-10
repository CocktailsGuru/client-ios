//
//  TableViewControllerThree.swift
//  CG2
//
//  Created by Tomáš Dobrotka on 09/03/2018.
//  Copyright © 2018 Tomáš Dobrotka. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TableViewControllerThree: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellThree", for: indexPath) as! TableViewCellThree

        // Configure the cell...

        return cell
    }
    
}

extension TableViewControllerThree : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "TOP 100")
    }
}
