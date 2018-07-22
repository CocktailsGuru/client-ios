//
//  IngredientType.swift
//  CG2
//
//  Created by Tomáš Dobrotka on 22/07/2018.
//  Copyright © 2018 Tomáš Dobrotka. All rights reserved.
//

import Foundation

class IngredientType {
    
    private var _id: Int!
    private var _name: String!
    
    var id: Int{
        return _id
    }
    
    var name: String{
        return _name
    }
    
    init(id: Int, name: String){
        self._id = id
        self._name = name
    }
    
}




//data class IngredientType(
//val id: Int,
//val name: String
//) : Parcelable
