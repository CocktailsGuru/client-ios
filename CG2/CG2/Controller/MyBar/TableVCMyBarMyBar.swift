//
//  TableVCMyBarMyBar.swift
//  CG2
//
//  Created by Tomáš Dobrotka on 22/03/2018.
//  Copyright © 2018 Tomáš Dobrotka. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class TableVCMyBarMyBar: UITableViewController {
    
    var myBarMyBarItems: [MyBarMyBarItem] = []
    
    @IBAction func myBarMyBarItemSwitch(_ sender: UISwitch) {
        //print("BTN WAS PRESSEDDDDDDDD")
        let point = sender.convert(CGPoint.zero, to: tableView)
        guard let indexPath = tableView.indexPathForRow(at: point) else {
            return
        }
        self.removeMyBarMyBarItem(atIndexPath: indexPath)
       // tableView.deleteRows(at: [indexPath], with: .left)
        self.fetchCoreDataObjects()
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCoreDataObjects()
        tableView.reloadData()
    }
    
    func fetchCoreDataObjects(){
        self.fetch{(complete) in
            if complete {
                if myBarMyBarItems.count >= 1 {
                    tableView.isHidden = false
                } else {
                    tableView.isHidden = true
                }
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1 
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myBarMyBarItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellOne", for: indexPath) as? TableViewCellMyBarMyBar else {return UITableViewCell() }
        let myBarMyBarItem = myBarMyBarItems[indexPath.row]
        cell.configureCell(img: myBarMyBarItem.myBarMyBarItemImg!, name: myBarMyBarItem.myBarMyBarItemLbl!, switchBool: myBarMyBarItem.myBarMyBarItemSwitchStatus)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none  // maybe the same as return UITableViewCellEditingStyle.none
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

        let deleteAction = UITableViewRowAction(style: .normal, title: "DELETE") { (rowAction, indexPath) in
            
            self.removeMyBarMyBarItem(atIndexPath: indexPath)
            self.fetchCoreDataObjects()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        deleteAction.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)

        return [deleteAction]
    }
}

extension TableVCMyBarMyBar : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "MY BAR")
    }
}

extension TableVCMyBarMyBar{
    func removeMyBarMyBarItem(atIndexPath indexPath: IndexPath){
        print("REMOOVE")
        //print("*****************",myBarMyBarItems.count,"*****************")
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }

        managedContext.delete(myBarMyBarItems[indexPath.row])
        do {
            try managedContext.save()
            print("Succesfully removed myBarMyBarItem!")
        } catch {
            debugPrint("Could not remove: \(error.localizedDescription)")
        }
    }
    
    func fetch(completion: (_ complete: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let fetchRequest = NSFetchRequest<MyBarMyBarItem>(entityName: "MyBarMyBarItem")
        
        do {
            myBarMyBarItems = try managedContext.fetch(fetchRequest)
            print("Succesfully fetched data.")
            completion(true)
        } catch{
            debugPrint("Could not fetch: \(error.localizedDescription)")
            completion(false)
        }
    }
    
}
