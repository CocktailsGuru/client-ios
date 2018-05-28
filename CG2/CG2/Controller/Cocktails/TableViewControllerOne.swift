//
//  TableViewControllerOne.swift
//  CG2
//
//  Created by Tomáš Dobrotka on 09/03/2018.
//  Copyright © 2018 Tomáš Dobrotka. All rights reserved.
//

import UIKit
import XLPagerTabStrip
class TableViewControllerOne: UITableViewController {

    
    var cocktailList = CocktailList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print("[1]Vypise sa len raz, a to vtedy ked prvy krat po zapnuti appky prejdem na tento controller")

//        cocktailList.downloadCocktailList {
//            //setup UI to load downloaded data
//        }
//
        
        let jsonUrlString = "https://46.101.103.73:8443/cocktail/list?pageNumber=0&pageSize=100"
        //let jsonUrlString = "https://api.coindesk.com/v1/bpi/currentprice.json"

        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data , response, err) in
            //check error
            //check response status 200 OK
            
            guard let data = data else { return }
            
            let dataAsString = String(data: data, encoding: .utf8)
            print(dataAsString)
            
            
        }.resume()
        
    }


    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellOne", for: indexPath) as! TableViewCellOne

        return cell
    }
    

}

extension TableViewControllerOne : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "INTRO")
    }
}


