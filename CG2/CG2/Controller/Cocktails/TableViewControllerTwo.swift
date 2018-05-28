//
//  TableViewControllerTwo.swift
//  CG2
//
//  Created by Tomáš Dobrotka on 09/03/2018.
//  Copyright © 2018 Tomáš Dobrotka. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TableViewControllerTwo: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //print("[2]Vypise sa len raz, a to vtedy ked prvy krat po zapnuti appky prejdem na tento controller")
        
    }

  

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellTwo", for: indexPath) as! TableViewCellTwo

        // Configure the cell...

        return cell
    }
 

}

extension TableViewControllerTwo : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "IBA")
    }
}
