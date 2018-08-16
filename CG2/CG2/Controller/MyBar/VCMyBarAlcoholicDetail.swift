//
//  VCMyBarAlcoholicDetail.swift
//  CG2
//
//  Created by Tomáš Dobrotka on 29/03/2018.
//  Copyright © 2018 Tomáš Dobrotka. All rights reserved.
//


import UIKit
import CoreData

var mainImag : UIImage!

class VCMyBarAlcoholicDetail: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout   {
    
    private class func getContext() -> NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        return appDelegate.persistentContainer.viewContext
    }
    
    @IBOutlet weak var VCMBADDescription: UILabel!
    
    @IBOutlet weak var VCMBADMainImage: UIImageView!
    
    @IBOutlet weak var VCMBADScrollView: UIScrollView!
    
    @IBOutlet weak var MBADCollectionView: UICollectionView!
    
    @IBOutlet weak var VCMBADMyBarSwitch: UISwitch!
    @IBOutlet weak var VCMBADShoppingListSwitch: UISwitch!
    
    //commented because of global var in TableVCMyBarMyBar.swift and TableVCMyBarShoppingList.swift
    //    var myBarMyBarItems: [MyBarMyBarItem] = []
    //    var myBarShoppingListItems: [MyBarShoppingListItem] = []
    
    @IBAction func VCMBADMyBarSwitchWasPressed(_ sender: UISwitch) {
        
        //pass data to Core Data MyBarMyBarItem Model
        if ((VCMBADMyBarSwitch.isOn) && (!(myBarMyBarItems.contains( where: { $0.myBarMyBarItemLbl == self.title })))){    //when i tap, it is ON yet
            fetchSecond()       //maybe .save should be in do{} section in fetchSecond()
            self.save { (complete) in
            }
            
        }else if(!VCMBADMyBarSwitch.isOn){
            fetchSecond()       //maybe .save should be in do{} section in fetchSecond()
            if let index = myBarMyBarItems.index(where: { $0.myBarMyBarItemLbl == self.title }){
                VCMyBarAlcoholicDetail.deleteObject(myBarMyBarItem: myBarMyBarItems[index])
            }
            
        }else{
            print("ERROR: switch is not ON and not OFF!!!")
        }
        
    }
    
    @IBAction func VCMBASShoppingListWasPressed(_ sender: UISwitch) {
        //pass data to Core Data MyBarShoppingListItem Model
        if ((VCMBADShoppingListSwitch.isOn) && (!(myBarShoppingListItems.contains( where: { $0.myBarShoppingListItemLbl == self.title })))){    //when i tap, it is ON yet
            fetchSecondShoppingList()       //maybe .save should be in do{} section in fetchSecond()
            self.saveShoppingList { (complete) in
            }
            
        }else if(!VCMBADShoppingListSwitch.isOn){
            fetchSecondShoppingList()       //maybe .save should be in do{} section in fetchSecond()
            if let index = myBarShoppingListItems.index(where: { $0.myBarShoppingListItemLbl == self.title }){
                VCMyBarAlcoholicDetail.deleteObjectShoppingList(myBarShoppingListItem: myBarShoppingListItems[index])
            }
            
        }else{
            print("ERROR: switch is not ON and not OFF!!!")
        }
    }
    
    
    var imgName : String! = ""
    
    var itemId : Int!
    var ingredientDetailMyBarStruct: IngredientDetailMyBarStruct!
    var ingredientDetail: IngredientDetail!
    var imagg : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MBADCollectionView.dataSource = self
        MBADCollectionView.delegate = self
        //self.navigationController?.hidesBarsOnSwipe = true
        //self.navigationController?.hidesBarsOnTap = true
        
        //        self.navigationController?.navigationBar.tintColor = .green   //text
        //        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        //        self.navigationController?.navigationBar.shadowImage = UIImage()
        //self.scrollViewDidScroll(VCMBADScrollView)
        
        //        print(myBarAlcoholicItem.id)
        //        print(myBarAlcoholicItem.image)
        //        print(myBarAlcoholicItem.name)
        //        print(myBarAlcoholicItem.rating)
        
        
        //navigation - font style, font size, font color
        //self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont(name: "Arial", size: 30)!,NSAttributedStringKey.foregroundColor: UIColor.black]
        
        self.title = ingredientDetailMyBarStruct.name
        self.VCMBADMainImage.image = UIImage(named: "\(ingredientDetailMyBarStruct.imageName)")
        self.imgName = ingredientDetailMyBarStruct.imageName
        self.itemId = ingredientDetailMyBarStruct.id
        
        
        print("\(ingredientDetailMyBarStruct.imageName!)")
        
        
        IngredientService.instance.findIngredientImage(imageName: "\(ingredientDetailMyBarStruct.imageName!)"){ (success) in
            
            
            print("kk \(mainImag)")
            self.imagg = mainImag
            
            if success {
                print("@@@@@@@@2222")
                self.VCMBADMainImage.image = self.imagg
            }else{
                print("not success")
            }
     
        }
        
        IngredientService.instance.findDetailIngredients(ingredientId: self.itemId ) { (success) in
            print("EERRRRRR")
            self.ingredientDetail = IngredientService.instance.ingredientAllDetail
            //          print(self.ingredientDetail.description)
            if success {
                //                self.collection.reloadData()
                self.VCMBADDescription.text = self.ingredientDetail.description
            }else{
                print("not success")
            }
        }
        
        IngredientService.instance.findImgIngredients { (success) in
            //self.ingredientNonAlcoDetailMyBarStructs = IngredientService.instance.ingredientNonAlcoDetailMyBarStructs
            //            if success {
            //                self.collection.reloadData()
            //            }else{
            //                print("not success")
            //            }
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fetch{(complete) in
            if complete {
                if myBarMyBarItems.contains( where: { $0.myBarMyBarItemLbl == self.title }) {
                    // found
                    VCMBADMyBarSwitch.setOn(true, animated: false)
                } else {
                    // not
                    VCMBADMyBarSwitch.setOn(false, animated: false)
                }
            }
        }
        self.fetchShoppingList{(complete) in
            if complete {
                if myBarShoppingListItems.contains( where: { $0.myBarShoppingListItemLbl == self.title }) {
                    // found
                    VCMBADShoppingListSwitch.setOn(true, animated: false)
                } else {
                    // not
                    VCMBADShoppingListSwitch.setOn(false, animated: false)
                }
            }
        }
        
    }
    
    //settings for collection view
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MBADCell", for: indexPath) as? MBADCell {
            
            //items shadows
            cell.layer.shadowColor = UIColor.darkGray.cgColor
            cell.layer.shadowOffset = CGSize(width:0, height: 2.0)
            cell.layer.shadowRadius = 2.0
            cell.layer.shadowOpacity = 1.0
            cell.layer.masksToBounds = false;
            cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
            
            //example-random data
            let mBADItem = MBADItem(id: 1, name: "name", image: "5.png", rating: 2)
            cell.configureCell(mBADItem: mBADItem)
            //example-random data
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    //numer of all items in one section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    //number of sections(pod sebou)
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //size of item
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing : CGFloat = (collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing ?? 0.0
        let widthPerItem = (MBADCollectionView.frame.width  - spacing * 2) / 1.95        //num of items per width of MBADCollectionView(part of screen) //Min.-> 1.93-SE,1.94-X,1.95-PLUS
        let heightPerItem = (MBADCollectionView.frame.height  - spacing * 2) / 4.08    //num of items per height of MBADCollectionView(part of screen)
        return CGSize(width: widthPerItem, height: heightPerItem)       // height:260 - ok
    }
    
    //segue-passing data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vCMyBarAlcoholicDetailReadMore = segue.destination as? VCMyBarAlcoholicDetailReadMore{
            vCMyBarAlcoholicDetailReadMore.text = self.ingredientDetail.description
            vCMyBarAlcoholicDetailReadMore.imageName = self.ingredientDetail.imageName
   
        }
    }
    
//    //showing bar after swiping / TODO: not working
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print(scrollView.contentOffset.y)
//        var offset = scrollView.contentOffset.y / 150
//        offset = 0.5
//        print(offset)
//        if offset > 1{
//            offset = 1
//            self.navigationController?.navigationBar.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: offset)
//        }else{
//            self.navigationController?.navigationBar.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: offset)
//        }
//    }
    
    //save data to data model
    func save(completion: (_ finished: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let myBarMyBarItem = MyBarMyBarItem(context: managedContext)
        
        myBarMyBarItem.myBarMyBarItemId = Int32(itemId)
        myBarMyBarItem.myBarMyBarItemImg = imgName
        myBarMyBarItem.myBarMyBarItemLbl = title
        myBarMyBarItem.myBarMyBarItemSwitchStatus = true
        
        do{
            try managedContext.save()
            print("Succesfully saved data.")
            completion(true)
        } catch{
            debugPrint("Could not save: \(error.localizedDescription)")
            completion(false)
        }
    }
    
    func saveShoppingList(completion: (_ finished: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let myBarShoppingListItem = MyBarShoppingListItem(context: managedContext)
        
        myBarShoppingListItem.myBarShoppingListItemId = Int32(itemId)
        myBarShoppingListItem.myBarShoppingListItemImg = imgName
        myBarShoppingListItem.myBarShoppingListItemLbl = title
        myBarShoppingListItem.myBarShoppingListItemSwitchStatus = true
        
        
        do{
            try managedContext.save()
            print("Succesfully saved data.")
            completion(true)
        } catch{
            debugPrint("Could not save: \(error.localizedDescription)")
            completion(false)
        }
    }
    
}

extension VCMyBarAlcoholicDetail{
    
    class func deleteObject(myBarMyBarItem:MyBarMyBarItem) -> Bool{
        
        let context = getContext()
        context.delete(myBarMyBarItem)
        do{
            try context.save()
            return true
        }catch{
            return false
        }
    }
    
    class func deleteObjectShoppingList(myBarShoppingListItem:MyBarShoppingListItem) -> Bool{
        
        let context = getContext()
        context.delete(myBarShoppingListItem)
        do{
            try context.save()
            return true
        }catch{
            return false
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
    
    func fetchShoppingList(completion: (_ complete: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
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
    
    
    //maybe .save should be HERE in do{} section
    func fetchSecond(){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let fetchRequest = NSFetchRequest<MyBarMyBarItem>(entityName: "MyBarMyBarItem")
        do {
            myBarMyBarItems = try managedContext.fetch(fetchRequest)
            print("SECOND. Succesfully fetched data.")
            //completion(true)
        } catch{
            debugPrint("SECOND. Could not fetch: \(error.localizedDescription)")
            // completion(false)
        }
    }
    
    func fetchSecondShoppingList(){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let fetchRequest = NSFetchRequest<MyBarShoppingListItem>(entityName: "MyBarShoppingListItem")
        do {
            myBarShoppingListItems = try managedContext.fetch(fetchRequest)
            print("SECOND. Succesfully fetched data.")
            //completion(true)
        } catch{
            debugPrint("SECOND. Could not fetch: \(error.localizedDescription)")
            // completion(false)
        }
    }
    
}



//    ///////////////
//    //
//    // OLD
//    //
//    ///////////////
//
//import UIKit
//import CoreData
//
//class VCMyBarAlcoholicDetail: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout   {
//
//    private class func getContext() -> NSManagedObjectContext{
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//
//        return appDelegate.persistentContainer.viewContext
//    }
//
//    @IBOutlet weak var VCMBADMainImage: UIImageView!
//
//    @IBOutlet weak var VCMBADScrollView: UIScrollView!
//
//    @IBOutlet weak var MBADCollectionView: UICollectionView!
//
//    @IBOutlet weak var VCMBADMyBarSwitch: UISwitch!
//    @IBOutlet weak var VCMBADShoppingListSwitch: UISwitch!
//
//    //commented because of global var in TableVCMyBarMyBar.swift and TableVCMyBarShoppingList.swift
////    var myBarMyBarItems: [MyBarMyBarItem] = []
////    var myBarShoppingListItems: [MyBarShoppingListItem] = []
//
//    @IBAction func VCMBADMyBarSwitchWasPressed(_ sender: UISwitch) {
//
//        //pass data to Core Data MyBarMyBarItem Model
//        if ((VCMBADMyBarSwitch.isOn) && (!(myBarMyBarItems.contains( where: { $0.myBarMyBarItemLbl == self.title })))){    //when i tap, it is ON yet
//            fetchSecond()       //maybe .save should be in do{} section in fetchSecond()
//            self.save { (complete) in
//            }
//
//        }else if(!VCMBADMyBarSwitch.isOn){
//            fetchSecond()       //maybe .save should be in do{} section in fetchSecond()
//            if let index = myBarMyBarItems.index(where: { $0.myBarMyBarItemLbl == self.title }){
//                VCMyBarAlcoholicDetail.deleteObject(myBarMyBarItem: myBarMyBarItems[index])
//            }
//
//        }else{
//            print("ERROR: switch is not ON and not OFF!!!")
//        }
//
//    }
//
//    @IBAction func VCMBASShoppingListWasPressed(_ sender: UISwitch) {
//        //pass data to Core Data MyBarShoppingListItem Model
//        if ((VCMBADShoppingListSwitch.isOn) && (!(myBarShoppingListItems.contains( where: { $0.myBarShoppingListItemLbl == self.title })))){    //when i tap, it is ON yet
//            fetchSecondShoppingList()       //maybe .save should be in do{} section in fetchSecond()
//            self.saveShoppingList { (complete) in
//            }
//
//        }else if(!VCMBADShoppingListSwitch.isOn){
//            fetchSecondShoppingList()       //maybe .save should be in do{} section in fetchSecond()
//            if let index = myBarShoppingListItems.index(where: { $0.myBarShoppingListItemLbl == self.title }){
//                VCMyBarAlcoholicDetail.deleteObjectShoppingList(myBarShoppingListItem: myBarShoppingListItems[index])
//            }
//
//        }else{
//            print("ERROR: switch is not ON and not OFF!!!")
//        }
//    }
//
//
//    var imgName : String! = ""
//
//    var myBarAlcoholicItem: MyBarAlcoholicItem!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        MBADCollectionView.dataSource = self
//        MBADCollectionView.delegate = self
//        //self.navigationController?.hidesBarsOnSwipe = true
//        //self.navigationController?.hidesBarsOnTap = true
//
////        self.navigationController?.navigationBar.tintColor = .green   //text
////        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
////        self.navigationController?.navigationBar.shadowImage = UIImage()
//        //self.scrollViewDidScroll(VCMBADScrollView)
//
////        print(myBarAlcoholicItem.id)
////        print(myBarAlcoholicItem.image)
////        print(myBarAlcoholicItem.name)
////        print(myBarAlcoholicItem.rating)
//
//
//        //navigation - font style, font size, font color
//        //self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont(name: "Arial", size: 30)!,NSAttributedStringKey.foregroundColor: UIColor.black]
//
//        self.title = myBarAlcoholicItem.name
//        self.VCMBADMainImage.image = UIImage(named: "\(myBarAlcoholicItem.image)")
//        self.imgName = myBarAlcoholicItem.image
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.fetch{(complete) in
//            if complete {
//                if myBarMyBarItems.contains( where: { $0.myBarMyBarItemLbl == self.title }) {
//                    // found
//                    print("YESSSSSSSSSSS")
//                    VCMBADMyBarSwitch.setOn(true, animated: false)
//                } else {
//                    // not
//                    print("NOOOOOOOOOOOO")
//                    VCMBADMyBarSwitch.setOn(false, animated: false)
//                }
//            }
//        }
//        self.fetchShoppingList{(complete) in
//            if complete {
//                if myBarShoppingListItems.contains( where: { $0.myBarShoppingListItemLbl == self.title }) {
//                    // found
//                    print("YESSSSSSSSSSS")
//                    VCMBADShoppingListSwitch.setOn(true, animated: false)
//                } else {
//                    // not
//                    print("NOOOOOOOOOOOO")
//                    VCMBADShoppingListSwitch.setOn(false, animated: false)
//                }
//            }
//        }
//
//    }
//
//    //settings for collection view
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MBADCell", for: indexPath) as? MBADCell {
//
//            //items shadows
//            cell.layer.shadowColor = UIColor.darkGray.cgColor
//            cell.layer.shadowOffset = CGSize(width:0, height: 2.0)
//            cell.layer.shadowRadius = 2.0
//            cell.layer.shadowOpacity = 1.0
//            cell.layer.masksToBounds = false;
//            cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
//
//            //example-random data
//            let mBADItem = MBADItem(id: 1, name: "name", image: "5.png", rating: 2)
//            cell.configureCell(mBADItem: mBADItem)
//            //example-random data
//
//            return cell
//        } else {
//            return UICollectionViewCell()
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//    }
//
//    //numer of all items in one section
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 8
//    }
//
//    //number of sections(pod sebou)
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//
//    //size of item
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let spacing : CGFloat = (collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing ?? 0.0
//        let widthPerItem = (MBADCollectionView.frame.width  - spacing * 2) / 1.95        //num of items per width of MBADCollectionView(part of screen) //Min.-> 1.93-SE,1.94-X,1.95-PLUS
//        let heightPerItem = (MBADCollectionView.frame.height  - spacing * 2) / 4.08    //num of items per height of MBADCollectionView(part of screen)
//        return CGSize(width: widthPerItem, height: heightPerItem)       // height:260 - ok
//    }
//
//    //segue-passing data
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let vCMyBarAlcoholicDetailReadMore = segue.destination as? VCMyBarAlcoholicDetailReadMore{
//           // if let myBarAlcoholicItem = sender as? MyBarAlcoholicItem {   //NOT WORKING
//                vCMyBarAlcoholicDetailReadMore.myBarAlcoholicItem = myBarAlcoholicItem
//
//           // }
//        }
//    }
//
//    //showing bar after swiping / TODO: not working
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print(scrollView.contentOffset.y)
//        var offset = scrollView.contentOffset.y / 150
//        offset = 0.5
//        print(offset)
//        if offset > 1{
//            offset = 1
//            self.navigationController?.navigationBar.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: offset)
//        }else{
//            self.navigationController?.navigationBar.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: offset)
//        }
//    }
//
//    //save data to data model
//    func save(completion: (_ finished: Bool) -> ()) {
//        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
//        let myBarMyBarItem = MyBarMyBarItem(context: managedContext)
//
//        myBarMyBarItem.myBarMyBarItemImg = imgName
//        myBarMyBarItem.myBarMyBarItemLbl = title
//        myBarMyBarItem.myBarMyBarItemSwitchStatus = true
//
//        do{
//            try managedContext.save()
//            print("Succesfully saved data.")
//            completion(true)
//        } catch{
//            debugPrint("Could not save: \(error.localizedDescription)")
//            completion(false)
//        }
//    }
//
//    func saveShoppingList(completion: (_ finished: Bool) -> ()) {
//        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
//        let myBarShoppingListItem = MyBarShoppingListItem(context: managedContext)
//
//        myBarShoppingListItem.myBarShoppingListItemImg = imgName
//        myBarShoppingListItem.myBarShoppingListItemLbl = title
//        myBarShoppingListItem.myBarShoppingListItemSwitchStatus = true
//
//
//        do{
//            try managedContext.save()
//            print("Succesfully saved data.")
//            completion(true)
//        } catch{
//            debugPrint("Could not save: \(error.localizedDescription)")
//            completion(false)
//        }
//    }
//
//}
//
//extension VCMyBarAlcoholicDetail{
//
//    class func deleteObject(myBarMyBarItem:MyBarMyBarItem) -> Bool{
//
//        let context = getContext()
//        context.delete(myBarMyBarItem)
//        do{
//            try context.save()
//            return true
//        }catch{
//            return false
//        }
//    }
//
//    class func deleteObjectShoppingList(myBarShoppingListItem:MyBarShoppingListItem) -> Bool{
//
//        let context = getContext()
//        context.delete(myBarShoppingListItem)
//        do{
//            try context.save()
//            return true
//        }catch{
//            return false
//        }
//    }
//
//    func fetch(completion: (_ complete: Bool) -> ()) {
//        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
//
//        let fetchRequest = NSFetchRequest<MyBarMyBarItem>(entityName: "MyBarMyBarItem")
//
//        do {
//            myBarMyBarItems = try managedContext.fetch(fetchRequest)
//            print("Succesfully fetched data.")
//            completion(true)
//        } catch{
//            debugPrint("Could not fetch: \(error.localizedDescription)")
//            completion(false)
//        }
//    }
//
//    func fetchShoppingList(completion: (_ complete: Bool) -> ()) {
//        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
//
//        let fetchRequest = NSFetchRequest<MyBarShoppingListItem>(entityName: "MyBarShoppingListItem")
//
//        do {
//            myBarShoppingListItems = try managedContext.fetch(fetchRequest)
//            print("Succesfully fetched data.")
//            completion(true)
//        } catch{
//            debugPrint("Could not fetch: \(error.localizedDescription)")
//            completion(false)
//        }
//    }
//
//
//    //maybe .save should be HERE in do{} section
//    func fetchSecond(){
//        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
//        let fetchRequest = NSFetchRequest<MyBarMyBarItem>(entityName: "MyBarMyBarItem")
//        do {
//            myBarMyBarItems = try managedContext.fetch(fetchRequest)
//            print("SECOND. Succesfully fetched data.")
//            //completion(true)
//        } catch{
//            debugPrint("SECOND. Could not fetch: \(error.localizedDescription)")
//            // completion(false)
//        }
//    }
//
//    func fetchSecondShoppingList(){
//        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
//        let fetchRequest = NSFetchRequest<MyBarShoppingListItem>(entityName: "MyBarShoppingListItem")
//        do {
//            myBarShoppingListItems = try managedContext.fetch(fetchRequest)
//            print("SECOND. Succesfully fetched data.")
//            //completion(true)
//        } catch{
//            debugPrint("SECOND. Could not fetch: \(error.localizedDescription)")
//            // completion(false)
//        }
//    }
//
//}
//
//    ///////////////
//    //
//    // OLD
//    //
//    ///////////////
