//
//  Constants.swift
//  CG2
//
//  Created by Tomáš Dobrotka on 14/05/2018.
//  Copyright © 2018 Tomáš Dobrotka. All rights reserved.
//

import Foundation

//let BASE_URL = "https://www.footyapps.com:8443/actuator/cocktail/list?pageNumber=0&pageSize=100"

//let BASE_URL = "https://www.footyapps.com:8443/cocktail/list?pageNumber=0&pageSize=100"

let BASE_URL = "https://www.footyapps.com/cocktail/list?pageNumber=0&pageSize=100"

//let BASE_URL = "https://www.footyapps.com/actuator/health"

//let BASE_URL = "https://46.101.103.73:8443/cocktail/list?pageNumber=0&pageSize=100"



//let BASE_URL = "https://www.footyapps.com/"



typealias  DownloadComplete = () -> ()

typealias CompletionHandler = (_ Success: Bool) -> ()


//{{method}}://{{host}}/cocktail/list?pageNumber=0&pageSize=100

//https://46.101.103.73:8443/cocktail/list?pageNumber=0&pageSize=100




// swift 3 course
let BASE = "https://www.footyapps.com"
let COCKTAIL = "cocktail"
let LIST = "list?"
let PAGENUMBER = "pageNumber="
let PAGESIZE = "pageSize="

let COCKTAILLISTURL = "\(BASE)/\(COCKTAIL)/\(LIST)\(PAGENUMBER)0&\(PAGESIZE)10"


//images
//let IMG4 = "4.jpg"
//let ASSETSINGREDIENTIMG = "\(BASE_URL)assets/ingred/thumb_300/\(IMG4)"
let ASSETSINGREDIENTIMG = "https://www.footyapps.com/assets/ingred/thumb_300/4.jpg"
let INGREDIENTIMG = "\(BASE)/assets/ingred/thumb_300/"  //name of the img needed



//ingredient list
let URL_INGREDIENTLIST = "/ingredient/list"       //    "https://www.footyapps.com/ingredient/list?pageNumber=0&pageSize=150&ingredientType=NON_ALCO"
let INGREDIENTLIST_PAGENUMBER = "?pageNumber="
let INGREDIENTLIST_PAGESIZE = "&pageSize="
let INGREDIENTLIST_ALCO = "&ingredientType=ALCO"
let INGREDIENTLIST_NON_ALCO = "&ingredientType=NON_ALCO"

let FULL_URL_INGREDIENTLIST_ALCO = "\(BASE)\(URL_INGREDIENTLIST)\(INGREDIENTLIST_PAGENUMBER)0\(INGREDIENTLIST_PAGESIZE)150\(INGREDIENTLIST_ALCO)"
let FULL_URL_INGREDIENTLIST_NON_ALCO = "\(BASE)\(URL_INGREDIENTLIST)\(INGREDIENTLIST_PAGENUMBER)0\(INGREDIENTLIST_PAGESIZE)150\(INGREDIENTLIST_NON_ALCO)"

let INGREDIENT_DETAIL_DETAIL = "/ingredient/detail?"
let INGREDIENT_DETAIL_ID = "id="

let INGREDIENT_DETAIL_BASE = "\(BASE)\(INGREDIENT_DETAIL_DETAIL)\(INGREDIENT_DETAIL_ID)"


let INGREDIENT_IMG = "https://www.footyapps.com/assets/ingred/full/1.jpg"
let BASE_INGREDIENT_IMG = "https://www.footyapps.com/assets/ingred/full/"
