//
//  VCMyBarAlcoholic.swift
//  CG2
//
//  Created by Tomáš Dobrotka on 23/03/2018.
//  Copyright © 2018 Tomáš Dobrotka. All rights reserved.
//

import Foundation
import UIKit
import XLPagerTabStrip

struct MyBarAlcoholicStruct: Decodable {
    var id : Int!
    var name : String!
    var image : String!
    var calculatedRating : Int!
    var alcoVolumeid : Int!
    var numOfFavorite : Int!
}

var MyBarAlcoholicStructsArr = [ MyBarAlcoholicItem ]()

class VCMyBarAlcoholic: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationController?.hidesBarsOnSwipe = true    //when there is no item on the bar, bar is still there
        

//************************************************************************************************
//************************************************************************************************
//BEGIN-DATA-simulation
        var alco1 = MyBarAlcoholicStruct()
        alco1.id  = 1
        alco1.name = "Irish Eyes"
        alco1.image = "1.png"
        alco1.calculatedRating  = 5
        alco1.alcoVolumeid  = 70
        alco1.numOfFavorite  = 10
        
//        print("\(alco1)","ss")
//        print(alco1.name, "KKK", "\(alco1.id)")
        
        var alco2 = MyBarAlcoholicStruct()
        alco2.id  = 2
        alco2.name = "Starboard"
        alco2.image = "2.png"
        alco2.calculatedRating  = 3
        alco2.alcoVolumeid  = 2
        alco2.numOfFavorite  = 4
        
        var alco3 = MyBarAlcoholicStruct()
        alco3.id  = 3
        alco3.name = "Amabile"
        alco3.image = "3.png"
        alco3.calculatedRating  = 2
        alco3.alcoVolumeid  = 70
        alco3.numOfFavorite  = 10
        
        var alco4 = MyBarAlcoholicStruct()
        alco4.id  = 4
        alco4.name = "Tie Break"
        alco4.image = "4.png"
        alco4.calculatedRating  = 0
        alco4.alcoVolumeid  = 70
        alco4.numOfFavorite  = 10
        
        var alco5 = MyBarAlcoholicStruct()
        alco5.id  = 5
        alco5.name = "Blue Flannel"
        alco5.image = "5.png"
        alco5.calculatedRating  = 1
        alco5.alcoVolumeid  = 70
        alco5.numOfFavorite  = 10
        
        var alco6 = MyBarAlcoholicStruct()
        alco6.id  = 6
        alco6.name = "Whispering Grass"
        alco6.image = "6.png"
        alco6.calculatedRating  = 2
        alco6.alcoVolumeid  = 70
        alco6.numOfFavorite  = 10
        
        var alco7 = MyBarAlcoholicStruct()
        alco7.id  = 7
        alco7.name = "Glacier Mint"
        alco7.image = "7.png"
        alco7.calculatedRating  = 0
        alco7.alcoVolumeid  = 70
        alco7.numOfFavorite  = 10
        
        var alco8 = MyBarAlcoholicStruct()
        alco8.id  = 8
        alco8.name = "After Ten"
        alco8.image = "8.png"
        alco8.calculatedRating  = 3
        alco8.alcoVolumeid  = 180
        alco8.numOfFavorite  = 0
        
        var alco9 = MyBarAlcoholicStruct()
        alco9.id  = 9
        alco9.name = "Perfect Stinger"
        alco9.image = "9.png"
        alco9.calculatedRating  = 2
        alco9.alcoVolumeid  = 70
        alco9.numOfFavorite  = 11
        
        var alco10 = MyBarAlcoholicStruct()
        alco10.id  = 10
        alco10.name = "Cacao Mint Cocktail"
        alco10.image = "10.png"
        alco10.calculatedRating  = 5
        alco10.alcoVolumeid  = 70
        alco10.numOfFavorite  = 10
        
        var alco11 = MyBarAlcoholicStruct()
        alco11.id  = 11
        alco11.name = "Creme De Menthe 'Frappe'"
        alco11.image = "11.png"
        alco11.calculatedRating  = 0
        alco11.alcoVolumeid  = 70
        alco11.numOfFavorite  = 10
        
        var alcoArr = [MyBarAlcoholicStruct]()
        alcoArr = [alco1, alco2, alco3, alco4, alco5, alco6, alco7, alco8, alco9, alco10, alco11]
        //print(alcoArr.count)
        // print(alco3.calculatedRating)

//END-DATA-simulation
//************************************************************************************************
//************************************************************************************************

        collection.dataSource = self
        collection.delegate = self

        //parseAlcoholic(alcoArr: alcoArr)
        
        //   let path = Bundle.main.path(forResource: "example", ofType: "json")!
    
//        let filepath = Bundle.main.path(forResource: "example", ofType: "json")
//        let url = URL(fileURLWithPath: filepath!)
//
//        do{
//            let data =  try Data(contentsOf:url)
//            let colors = try JSONDecoder().decode(MyBarAlcoholicStruct.self,from: data)
//            print(colors.name)
//        }
//        catch {}
      
        //print(alcoArr)
        parseAlcoholic(alcoArr: alcoArr)

        
        
        
        // SERVER DATA
        
        
//        IngredientService.instance.findAllIngredients { (success) in
//            
//        }
        
        
        
        
        
   
    }
    
    
  
    func parseAlcoholic(alcoArr : [MyBarAlcoholicStruct]){
        var alcoArr = alcoArr
        for index in 0...10{
//            var alcoIndex = "alco" + "\(index)"
//            print(alcoIndex)
            
            let id = alcoArr[index].id!
            let name = alcoArr[index].name!
            let image = alcoArr[index].image!
            let rating = alcoArr[index].calculatedRating!
            
            let alcoItem = MyBarAlcoholicItem(id: id, name: name, image: image, rating: rating)
            MyBarAlcoholicStructsArr.append(alcoItem)
            
        }
    }
    
    
    //settings for collection view
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyBarAlcoholicCell", for: indexPath) as? MyBarAlcoholicCell {
            print("#############################################")
            
            //items shadows
            cell.layer.shadowColor = UIColor.darkGray.cgColor
            cell.layer.shadowOffset = CGSize(width:0, height: 2.0)
            cell.layer.shadowRadius = 2.0
            cell.layer.shadowOpacity = 1.0
            cell.layer.masksToBounds = false;
            cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
            
            
            
//
//            let ingredientDetailMyBarStruct = IngredientService.instance.ingredientDetailMyBarStructs[indexPath.row]
//            cell.configureCell(ingredientDetailMyBarStruct: ingredientDetailMyBarStruct)
//            return cell
//        } else {
//            return UICollectionViewCell()
//        }
            
        
            let alco = MyBarAlcoholicStructsArr[indexPath.row]
            cell.configureCell(myBarAlcoholicItem: alco)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var alco: MyBarAlcoholicItem!
        alco = MyBarAlcoholicStructsArr[indexPath.row]

        performSegue(withIdentifier: "VCMyBarAlcoholicDetail", sender: alco)
    }
    
    //numer of all items in one section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return movie.count
        return 11
    }
    
    //number of sections(pod sebou)
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //item sizes
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing : CGFloat = (collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing ?? 0.0
        let widthPerItem = (view.frame.width  - spacing * 2) / 2        //num of items per width
        let heightPerItem = (view.frame.height  - spacing * 2) / 2.5    //num of items per height

        return CGSize(width: widthPerItem, height: heightPerItem)       // height:260 - ok
    }
    
    //segue-passing data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vCMyBarAlcoholicDetail = segue.destination as? VCMyBarAlcoholicDetail{
                        
            if let myBarAlcoholicItemm = sender as? MyBarAlcoholicItem {
                vCMyBarAlcoholicDetail.myBarAlcoholicItem = myBarAlcoholicItemm
                //print(myBarAlcoholicItemm.rating)
            }
        }
    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "VCMyBarAlcoholicDetail" {
//            if let vCMyBarAlcoholicDetail = segue.destination as? VCMyBarAlcoholicDetail{
//                if let alco = sender as? MyBarAlcoholicItem {
//                    vCMyBarAlcoholicDetail.myBarAlcoholicItem = alco
//                }
//            }
//        }
//    }
    
}

    //Title
    extension VCMyBarAlcoholic : IndicatorInfoProvider {
        func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
            return IndicatorInfo(title: "ALCOHOLIC")
        }
    }




