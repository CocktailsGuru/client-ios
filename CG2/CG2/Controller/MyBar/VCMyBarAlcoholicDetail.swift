//
//  VCMyBarAlcoholicDetail.swift
//  CG2
//
//  Created by Tomáš Dobrotka on 29/03/2018.
//  Copyright © 2018 Tomáš Dobrotka. All rights reserved.
//

import UIKit

class VCMyBarAlcoholicDetail: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout   {
    
    @IBOutlet weak var VCMBADMainImage: UIImageView!
    @IBOutlet weak var VCMBADScrollView: UIScrollView!
    
    @IBOutlet weak var MBADCollectionView: UICollectionView!
    
    var myBarAlcoholicItem: MyBarAlcoholicItem!
    
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

        self.title = myBarAlcoholicItem.name
        self.VCMBADMainImage.image = UIImage(named: "\(myBarAlcoholicItem.image)")
        
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
           // if let myBarAlcoholicItem = sender as? MyBarAlcoholicItem {   //NOT WORKING
                vCMyBarAlcoholicDetailReadMore.myBarAlcoholicItem = myBarAlcoholicItem
           // }
        }
    }
    
    //showing bar after swiping / TODO: not working
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        var offset = scrollView.contentOffset.y / 150
        offset = 0.5
        print(offset)
        if offset > 1{
            offset = 1
            self.navigationController?.navigationBar.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: offset)
        }else{
            self.navigationController?.navigationBar.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: offset)
        }
    }
    

}




