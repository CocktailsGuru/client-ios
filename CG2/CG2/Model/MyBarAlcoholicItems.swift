//
//  MyBarAlcoholicItems.swift
//  CG2
//
//  Created by Tomáš Dobrotka on 23/03/2018.
//  Copyright © 2018 Tomáš Dobrotka. All rights reserved.
//

import Foundation

class MyBarAlcoholicItem {
    
    private var _id: Int!
    private var _name: String!
    private var _image: String!
    private var _rating: Int!
    
    var id: Int{
        return _id
    }
    
    var name: String{
        return _name
    }
    
    var image: String{
        return _image
    }
    
    var rating: Int{
        return _rating
    }
    
    init(id: Int, name: String, image: String, rating: Int) {
        self._id = id
        self._name = name
        self._image = image
        self._rating = rating
    }
  
}
