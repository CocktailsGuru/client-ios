//
//  CocktailDetail.swift
//  CG2
//
//  Created by Tomáš Dobrotka on 06/07/2018.
//  Copyright © 2018 Tomáš Dobrotka. All rights reserved.
//

//TODO
import UIKit
import Alamofire

class CocktailDetail{
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
    
    
    
    func downloadCocktailDetail(completed: DownloadComplete) {
        print("sssssss")
        let user = "=="
        let password = "=="
        let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers = ["Authorization": "Basic \(base64Credentials)"]
        
        Alamofire.request(BASE_URL,
                          method: .get,
                          parameters: nil,
                          encoding: URLEncoding.default,
                          headers:headers)
            .validate()
            .responseJSON { response in
                if response.result.value != nil{
                    print(response)
                }else{
                    
                }
        }
        
    }
    
    
    //    func downloadCocktailList(completed: DownloadComplete) {
    //        //alamofire download
    //        let baseURL = URL(string: BASE_URL)!
    //
    //        Alamofire.request(baseURL).responseJSON { response in
    //
    //            let result = response.result
    //
    //            print(response)
    //
    //        }
    //
    //        completed()
    //
    //    }
    
}
