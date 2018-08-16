//
//  VCMyBarNonAlcoholic.swift
//  CG2
//
//  Created by Tomáš Dobrotka on 22/03/2018.
//  Copyright © 2018 Tomáš Dobrotka. All rights reserved.
//



import Foundation
import UIKit
import XLPagerTabStrip


//var MyBarAlcoholicStructsArr = [ MyBarAlcoholicItem ]()

class VCMyBarNonAlcoholic: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
   
    var ingredientNonAlcoDetailMyBarStructs = [IngredientDetailMyBarStruct]()
    

    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        

        
        
        
        
        
        // SERVER DATA
        IngredientService.instance.findAllNonAlcoIngredients { (success) in
 //           print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
 //           print(IngredientService.instance.ingredientDetailMyBarStructs.count)
            self.ingredientNonAlcoDetailMyBarStructs = IngredientService.instance.ingredientNonAlcoDetailMyBarStructs
            
            
//            print(self.ingredientDetailMyBarStructs.count,"KKKKK")
            if success {
                self.collection.reloadData()
            }else{
                print("not success")
            }
        }
        super.viewDidLoad()
//        print("dd")
        
        
        collection.dataSource = self
        collection.delegate = self
        
 //       parseAlcoholic(alcoArr: alcoArr)
        

        

        
    }
    
    
    
//    func parseAlcoholic(alcoArr : [MyBarAlcoholicStruct]){
//        var alcoArr = alcoArr
//        for index in 0...10{
//            //            var alcoIndex = "alco" + "\(index)"
//            //            print(alcoIndex)
//
//            let id = alcoArr[index].id!
//            let name = alcoArr[index].name!
//            let image = alcoArr[index].image!
//            let rating = alcoArr[index].calculatedRating!
//
//            let alcoItem = MyBarAlcoholicItem(id: id, name: name, image: image, rating: rating)
//            MyBarAlcoholicStructsArr.append(alcoItem)
//
//        }
//    }
    
    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        print("$$dddd$$$$$")
//        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyBarAlcoholicCell", for: indexPath) as? MyBarAlcoholicCell {
//            print("$$$$$$$")
//            return cell
//        }else {
//            print("DDDDDDD")
//            return UICollectionViewCell()
//        }
//    }
    
    var i : Int = 0
    
        //settings for collection view
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyBarNonAlcoholicCell", for: indexPath) as? MyBarNonAlcoholicCell {
 //            print("cell For Item At")

            //items shadows
            cell.layer.shadowColor = UIColor.darkGray.cgColor
            cell.layer.shadowOffset = CGSize(width:0, height: 2.0)
            cell.layer.shadowRadius = 2.0
            cell.layer.shadowOpacity = 1.0
            cell.layer.masksToBounds = false
            cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath

           

//            print("SHIIIT")
            i = i + 1
 //           print(self.ingredientDetailMyBarStructs.count)
  //          print(i)
            if (self.ingredientNonAlcoDetailMyBarStructs.count > 0){
                            let ingredientNonAlcoDetailMyBarStructs = self.ingredientNonAlcoDetailMyBarStructs[indexPath.row]
                
                
                cell.configureCell(ingredientNonAlcoDetailMyBarStructs: ingredientNonAlcoDetailMyBarStructs )
                return cell
            }
            
            return cell

        } else {
   //             print("dddd")
                return UICollectionViewCell()
        }

    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var nonAlco: IngredientDetailMyBarStruct!
        nonAlco = ingredientNonAlcoDetailMyBarStructs[indexPath.row]

        performSegue(withIdentifier: "VCMyBarNonAlcoholicDetail", sender: nonAlco)
    }

    //number of sections(pod sebou)
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        //print("num of section")
        return 1
    }

    //number of all items in one section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //print("number Of Items In Section")
        //print(self.ingredientNonAlcoDetailMyBarStructs.count)
        return self.ingredientNonAlcoDetailMyBarStructs.count
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
        if let vCMyBarNonAlcoholicDetail = segue.destination as? VCMyBarNonAlcoholicDetail{

            if let ingredientDetailMyBarStruct = sender as? IngredientDetailMyBarStruct {
                vCMyBarNonAlcoholicDetail.ingredientDetailMyBarStruct = ingredientDetailMyBarStruct
                //print(myBarAlcoholicItemm.rating)
            }
        }
    }
    
}

//Title
extension VCMyBarNonAlcoholic : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "NON ALCOHOLIC")
    }
}



