//
//  CocktailMethod.swift
//  CG2
//
//  Created by Tomáš Dobrotka on 22/07/2018.
//  Copyright © 2018 Tomáš Dobrotka. All rights reserved.
//

import Foundation

class CocktailMethod {
    
    private var _id: Int!
    private var _name: String!
    private var _description: String!

    var id: Int{
        return _id
    }
    
    var name: String{
        return _name
    }
    
    var description: String{
        return _description
    }
    
    init(id: Int, name: String, description: String){
        self._id = id
        self._name = name
        self._description = description
    }
    
}



//data class CocktailMethod(
//val id: Int,
//val name: String,
//val description: String
//)
