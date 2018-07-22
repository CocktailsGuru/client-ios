//
//  CocktailDetail.swift
//  CG2
//
//  Created by Tomáš Dobrotka on 22/07/2018.
//  Copyright © 2018 Tomáš Dobrotka. All rights reserved.
//

import Foundation

class CocktailDetail {
    
    private var _id: UInt32!
    private var _name: String!
    private var _totalVolume: Int!
    private var _alcoVolume: Int!
    private var _nonAlcoVolume: Int!
    private var _instructions: String!
    private var _garnish: String!
    private var _description: String!
    private var _imageName: String!
    private var _imageUrl: String!
    private var _glass: CocktailGlass!
    private var _method: CocktailMethod!
//    private var _ingredientList: List<Long>!
//    private var _similarCocktailList: List<Long>!
    private var _numOfFavorite: UInt32!
    private var _calculatedRating: Double!
    private var _numRating1: Int!
    private var _numRating2: Int!
    private var _numRating3: Int!
    private var _numRating4: Int!
    private var _numRating5: Int!
    private var _alcoholVolume: Double!
    private var _numPictures: Int!
    private var _numComments: Int!
    private var _numShowed: Int!

    var id: UInt32{
        return _id
    }
    
    var name: String{
        return _name
    }
    
    var totalVolume: Int{
        return _totalVolume
    }
    
    var alcoVolume: Int{
        return _alcoVolume
    }
    var nonAlcoVolume: Int{
        return _nonAlcoVolume
    }
    
    var instructions: String{
        return _instructions
    }
    
    var garnish: String{
        return _garnish
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
    
    var glass: CocktailGlass{
        return _glass
    }
    
    var method: CocktailMethod{
        return _method
    }
    
//    var ingredientList: List<Long>{
//        return _ingredientList
//    }
//
//    var similarCocktailList: List<Long>{
//        return _similarCocktailList
//    }
    
    var numOfFavorite: UInt32{
        return _numOfFavorite
    }
    
    var calculatedRating: Double{
        return _calculatedRating
    }
    
    var numRating1: Int{
        return _numRating1
    }
    
    var numRating2: Int{
        return _numRating2
    }
    
    var numRating3: Int{
        return _numRating3
    }
    
    var numRating4: Int{
        return _numRating4
    }
    
    var numRating5: Int{
        return _numRating5
    }
    
    var alcoholVolume: Double{
        return _alcoholVolume
    }
    
    var numPictures: Int{
        return _numPictures
    }
    
    var numComments: Int{
        return _numComments
    }
    
    var numShowed: Int{
        return _numShowed
    }
    
    
    
//    init(id: Int, name: String, image: String, rating: Int) {
//        self._id = id
//        self._name = name
//        self._image = image
//        self._rating = rating
//    }
    
    
    
    
}



//data class CocktailDetail(
//val id: Long,
//val name: String,
//val totalVolume: Int,
//val alcoVolume: Int,
//val nonAlcoVolume: Int,
//val instructions: String,
//val garnish: String,
//val description: String,
//val imageName: String,
//val imageUrl: String,
//val glass: CocktailGlass,
//val method: CocktailMethod,
//val ingredientList: List<Long>,
//val similarCocktailList: List<Long>,
//val numOfFavorite: Long,
//val calculatedRating: Double,
//val numRating1: Int,
//val numRating2: Int,
//val numRating3: Int,
//val numRating4: Int,
//val numRating5: Int,
//val alcoholVolume: Double,
//val numPictures: Int,
//val numComments: Int,
//val numShowed: Int
//)
