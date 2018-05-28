//
//  CocktailList.swift
//  CG2
//
//  Created by Tomáš Dobrotka on 14/05/2018.
//  Copyright © 2018 Tomáš Dobrotka. All rights reserved.
//

import UIKit
import Alamofire

class CocktailList{
    var _id : Int!
    var _name : String!
    var _image : String!
    var _calculatedRating : Double!
    var _alcoVolume : Int!
    var _numOfFavorite : Int!
    
    var id : Int {
        if _id == nil {
            _id = 0
        }
        return _id
    }
    
    var name : String {
        if _name == nil {
            _name = ""
        }
        return _name
    }
    
    var image : String {
        if _image == nil {
            _image = ""
        }
        return _image
    }
    
    var calculatedRating : Double {
        if _calculatedRating == nil {
            _calculatedRating = 0.0
        }
        return _calculatedRating
    }
    
    var alcoVolume : Int {
        if _alcoVolume == nil {
            _alcoVolume = 0
        }
        return _alcoVolume
    }
    
    var numOfFavorite : Int {
        if _numOfFavorite == nil {
            _numOfFavorite = 0
        }
        return _numOfFavorite
    }
    
    func downloadCocktailList(completed: DownloadComplete) {
        //alamofire download
        let baseURL = URL(string: BASE_URL)!
        Alamofire.request(baseURL).responseJSON { response in
            let result = response.result
            print(response)
        }
        completed()
        
    }
    
}
