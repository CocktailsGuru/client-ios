//
//  VCProfileAlcoholic.swift
//  CG2
//
//  Created by Tomáš Dobrotka on 23/03/2018.
//  Copyright © 2018 Tomáš Dobrotka. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class VCProfileAlcoholic: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
 @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collection.dataSource = self
        collection.delegate = self
    }

    
    //settings for collection view
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileAlcoholicCell", for: indexPath) as? ProfileAlcoholicCell {

            //asi inicializacia noveho
           // let mov = movie[indexPath.row]
           // cell.configureCell(mov)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        var mov: Movie!
//        //nemam vyhladavac filmov (search bar)
//        /*if inSearchMode {
//         mov = filteredMovie[indexPath.row]
//         }else { */
//        mov = movie[indexPath.row]
//        //}
//
//        performSegue(withIdentifier: "MovieDetailVC", sender: mov)
    }

    //numer of all items in one section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return movie.count
        return 50
    }

    //number of sections(pod sebou)
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    //size of item
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize( width: 196, height: 260)
    }

}


extension VCProfileAlcoholic : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "ALCOHOLIC")
    }
}
