//
//  IngredientDetail.swift
//  CG2
//
//  Created by Tomáš Dobrotka on 22/07/2018.
//  Copyright © 2018 Tomáš Dobrotka. All rights reserved.
//

import Foundation

class IngredientDetail {
    
    private var _id: Int!
    private var _name: String!
    private var _nameGrouped: String!
    private var _description: String!
    private var _imageName: String!
    private var _imageUrl: String!
    private var _numShowed: Int!
    private var _ingredientType: IngredientType!
    private var _voltage: Double!

    var id: Int{
        return _id
    }
    
    var name: String{
        return _name
    }
    
    var nameGrouped: String{
        return _nameGrouped
    }
    
    var description: String{
        return _description
    }
    var imageName: String{
        return _imageName
    }
    
    var imageUrl: String{
        return _imageUrl
    }
    
    var numShowed: Int{
        return _numShowed
    }
    
    var ingredientType: IngredientType{
        return _ingredientType
    }
    
    var voltage: Double{
        return _voltage
    }
  
    
    //    init(id: Int, name: String, image: String, rating: Int) {
    //        self._id = id
    //        self._name = name
    //        self._image = image
    //        self._rating = rating
    //    }
 
    
}




//ata class IngredientDetail(
//val id: Int,
//val name: String,
//val nameGrouped: String,
//val description: String,
//val imageName: String,
//val imageUrl: String,
//val numShowed: Int,
//val ingredientType: IngredientType,
//val voltage: Double
//) : Parcelable
