//
//  IngredientService.swift
//  CG2
//
//  Created by Tomáš Dobrotka on 23/07/2018.
//  Copyright © 2018 Tomáš Dobrotka. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class IngredientService {
    
    static let instance =  IngredientService()
    
    var ingredientNonAlcoDetailMyBarStructs = [IngredientDetailMyBarStruct]()
    var ingredientAlcoDetailMyBarStructs = [IngredientDetailMyBarStruct]()
    
    
//    NON_ALCO INGREDIENTS
    func findAllNonAlcoIngredients(completion: @escaping CompletionHandler) {
        
        //passwords, usernames, login
        let user = "=="
        let password = "=="
        let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers = ["Authorization": "Basic \(base64Credentials)"]
        
        Alamofire.request(FULL_URL_INGREDIENTLIST_NON_ALCO, method: .get, parameters: nil, encoding: JSONEncoding.default, headers:headers) .validate().responseJSON { (response) in
            
            guard let json = response.result.value as? Dictionary<String, AnyObject> else { return }
            
            let ingrDict = json["list"] as! Array<NSDictionary>
            for item in ingrDict {
                
                let id = item["id"] as! Int
                let name = item["nameGrouped"] as! String
                let imageName : String! = item["imageName"] as! String
//                print(imageName)
                let voltage = item["voltage"] as! String

                let ingredientNonAlcoDetailMyBarStructs = IngredientDetailMyBarStruct(id: id , name: name, imageName: imageName , voltage: voltage)
                self.ingredientNonAlcoDetailMyBarStructs.append(ingredientNonAlcoDetailMyBarStructs)
            
            }
            completion(true)
        }
    }
    
    
//    ALCO INGREDIENTS
    func findAllAlcoIngredients(completion: @escaping CompletionHandler) {
        
        //passwords, usernames, login
        let user = "=="
        let password = "=="
        let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers = ["Authorization": "Basic \(base64Credentials)"]
        
        Alamofire.request(FULL_URL_INGREDIENTLIST_ALCO, method: .get, parameters: nil, encoding: JSONEncoding.default, headers:headers) .validate().responseJSON { (response) in
            
            guard let json = response.result.value as? Dictionary<String, AnyObject> else { return }
            
            let ingrDict = json["list"] as! Array<NSDictionary>
            for item in ingrDict {
                
                let id = item["id"] as! Int
                let name = item["nameGrouped"] as! String
                let imageName : String! = item["imageName"] as! String
                //                print(imageName)
                let voltage = item["voltage"] as! String
                
                let ingredientAlcoDetailMyBarStructs = IngredientDetailMyBarStruct(id: id , name: name, imageName: imageName , voltage: voltage)
                self.ingredientAlcoDetailMyBarStructs.append(ingredientAlcoDetailMyBarStructs)
                
            }
            completion(true)
        }
    }
    

}