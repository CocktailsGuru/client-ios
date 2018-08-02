//
//  TableVCMyBarShoppingList.swift
//  CG2
//
//  Created by Tomáš Dobrotka on 22/03/2018.
//  Copyright © 2018 Tomáš Dobrotka. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import CoreData

let appDelegateSL = UIApplication.shared.delegate as? AppDelegate

var myBarShoppingListItems: [MyBarShoppingListItem] = []

class TableVCMyBarShoppingList: UITableViewController {
    
    
//
//    @IBAction func myBarShoppingListItemSwitch(_ sender: UISwitch) {
//
//    }
    
    @IBAction func myBarShoppingListItemSwitch(_ sender: UISwitch) {
        //print("BTN WAS PRESSEDDDDDDDD")
        let point = sender.convert(CGPoint.zero, to: tableView)
        guard let indexPath = tableView.indexPathForRow(at: point) else {
            return
        }
        self.removeMyBarShoppingListItem(atIndexPath: indexPath)
        // tableView.deleteRows(at: [indexPath], with: .left)
        self.fetchCoreDataObjects()
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    //@IBAction func myBarShoppingListItemSwitch(_ sender: UISwitch) {
        //print("BTN WAS PRESSEDDDDDDDD")
//        let point = sender.convert(CGPoint.zero, to: tableView)
//        guard let indexPath = tableView.indexPathForRow(at: point) else {
//            return
//        }
//        self.removeMyBarShoppingListItem(atIndexPath: indexPath)
//        // tableView.deleteRows(at: [indexPath], with: .left)
//        self.fetchCoreDataObjects()
//        tableView.deleteRows(at: [indexPath], with: .automatic)
//    }

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
                if myBarShoppingListItems.count >= 1 {
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
        return myBarShoppingListItems.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellOne", for: indexPath) as? TableViewCellMyBarShoppingList else {return UITableViewCell() }
        let myBarShoppingListItem = myBarShoppingListItems[indexPath.row]
        cell.configureCell(img: myBarShoppingListItem.myBarShoppingListItemImg!, name: myBarShoppingListItem.myBarShoppingListItemLbl!, switchBool: myBarShoppingListItem.myBarShoppingListItemSwitchStatus)
        
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

            self.removeMyBarShoppingListItem(atIndexPath: indexPath)
            self.fetchCoreDataObjects()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        deleteAction.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)

        return [deleteAction]
    }
    
    //selected row info, segue id
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var item: Int = 0
        print(Int(myBarShoppingListItems[indexPath.row].myBarShoppingListItemId))
        item = Int(myBarShoppingListItems[indexPath.row].myBarShoppingListItemId)
        print("PPPPPPPPPPPPPPP",myBarShoppingListItems[indexPath.row])
        
        performSegue(withIdentifier: "tableVCMyBarShoppingListTOvCMyBarNonAlcoholicDetail", sender: item)
    }
    
    //segue-passing data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vCMyBarNonAlcoholicDetail = segue.destination as? VCMyBarNonAlcoholicDetail{
            
            if let item = sender as? Int {
                vCMyBarNonAlcoholicDetail.itemMyBarMyBar = item
                
                //print(songItem.name)
            }
        }
    }
    
}

extension TableVCMyBarShoppingList : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "SHOPPING LIST")
    }
}

extension TableVCMyBarShoppingList{
    func removeMyBarShoppingListItem(atIndexPath indexPath: IndexPath){
        print("REMOOVE")
        //print("*****************",myBarShoppingListItems.count,"*****************")
        guard let managedContext = appDelegateSL?.persistentContainer.viewContext else { return }
        
        managedContext.delete(myBarShoppingListItems[indexPath.row])
        do {
            try managedContext.save()
            print("Succesfully removed myBarShoppingListItem!")
        } catch {
            debugPrint("Could not remove: \(error.localizedDescription)")
        }
    }
    
    func fetch(completion: (_ complete: Bool) -> ()) {
        guard let managedContext = appDelegateSL?.persistentContainer.viewContext else { return }
        
        let fetchRequest = NSFetchRequest<MyBarShoppingListItem>(entityName: "MyBarShoppingListItem")
        
        do {
            myBarShoppingListItems = try managedContext.fetch(fetchRequest)
            print("Succesfully fetched data.")
            completion(true)
        } catch{
            debugPrint("Could not fetch: \(error.localizedDescription)")
            completion(false)
        }
    }
    
}

