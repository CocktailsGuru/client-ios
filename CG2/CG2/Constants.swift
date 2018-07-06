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

typealias  DownloadComplete = () -> ()

//{{method}}://{{host}}/cocktail/list?pageNumber=0&pageSize=100

//https://46.101.103.73:8443/cocktail/list?pageNumber=0&pageSize=100




// swift 3 course
let BASE = "https://www.footyapps.com"
let COCKTAIL = "cocktail"
let LIST = "list?"
let PAGENUMBER = "pageNumber="
let PAGESIZE = "pageSize="

let COCKTAILLISTURL = "\(BASE)/\(COCKTAIL)/\(LIST)\(PAGENUMBER)0&\(PAGESIZE)10"
