//
//  MyIngredient.swift
//  CG2
//
//  Created by Tomáš Dobrotka on 22/07/2018.
//  Copyright © 2018 Tomáš Dobrotka. All rights reserved.
//

import Foundation

class MyIngredient {
    
    private var _ingredientId: Int!
    private var _name: String!
    private var _imageName: String!
    private var _imageUrl: String!
    private var _voltage: Double!
    private var _myBar: Bool!
    private var _shoppingCart: Bool!

    var ingredientId: Int{
        return _ingredientId
    }
    
    var name: String{
        return _name
    }
    
    var imageName: String{
        return _imageName
    }
    
    var imageUrl: String{
        return _imageUrl
    }
    
    var voltage: Double{
        return _voltage
    }
    
    var myBar: Bool{
        return _myBar
    }
    
    var shoppingCart: Bool{
        return _shoppingCart
    }
    
//    init(ingredientId: Int, name: String){
//        self._ingredientId = ingredientId
//        self._name = name
//    }
    
}


///**
// * Used to display list of ingredients that user has in his/her bar or shopping list.
// */
//data class MyIngredient(
//val ingredientId: Int,
//override val name: String,
//val imageName: String,
//override val imageUrl: String,
//val voltage: Double,
//val myBar: Boolean,
//val shoppingCart: Boolean
//) : BaseListItem(name, imageUrl)
