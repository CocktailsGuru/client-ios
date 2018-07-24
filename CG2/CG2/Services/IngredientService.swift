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
    
    var ingredientDetailMyBarStructs = [IngredientDetailMyBarStruct]()
    
    
    
    func findAllIngredients(completion: @escaping CompletionHandler) {
        //passwords, usernames, login
        let user = "=="
        let password = "=="
        let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers = ["Authorization": "Basic \(base64Credentials)"]
        
        
        Alamofire.request(URL_GET_INGREDIENTLIST, method: .get, parameters: nil, encoding: JSONEncoding.default, headers:headers) .validate().responseJSON { (response) in
            
            
            guard let json = response.result.value as? Dictionary<String, AnyObject> else { return }
            
  //          print(json)
            let ingrDict = json["list"] as! Array<NSDictionary>
            for item in ingrDict {
//                print(item.kind)
//                print(item["id"])
                
                let id = item["id"] as! Int

                var name = item["nameGrouped"] as! String
                let imageName : String! = item["imageName"] as! String
                var voltage = item["voltage"] as! String
                //voltage = voltage.toInt
//                print("OOOO",voltage.debugDescription)
//                 print("OOOO",imageName)
//                print("OOOO",name)
              //  print("OOOO",voltage)
               
                
               // let ingredientDetailMyBarStruct = IngredientDetailMyBarStruct(id: id as! Int, name: name as! String, imageName: imageName as! String, voltage: voltage as! Double)
                
                let ingredientDetailMyBarStruct = IngredientDetailMyBarStruct(id: id , name: name, imageName: imageName , voltage: voltage)
//                print("PPPP",id)
//                print("PPPP",ingredientDetailMyBarStruct.id!)
                
                self.ingredientDetailMyBarStructs.append(ingredientDetailMyBarStruct)
                
            
            }
         //   print(self.ingredientDetailMyBarStructs.count)
//            print("LLLLL",ingrDict)
           // print("LLLLL",self.ingredientDetailMyBarStructs)
            
      //      print(self.ingredientDetailMyBarStructs[4].name!)
            
            
            
            
            
            
            
            
//            let photosDict = json["photos"] as! Dictionary<String, AnyObject>
//            let photosDictArray = photosDict["photo"] as! [Dictionary<String, AnyObject>]
//            for photo in photosDictArray {
//                let postUrl = "https://farm\(photo["farm"]!).staticflickr.com/\(photo["server"]!)/\(photo["id"]!)_\(photo["secret"]!)_h_d.jpg"
//                self.imageUrlArray.append(postUrl)
//            }
            completion(true)
        }
    }
    
    
    
//    func findAllIngredients(completion: @escaping CompletionHandler) {
//        print("YEAHHHHHHHHH")
//
//
//        //passwords, usernames, login
//        let user = "android"
//        let password = "123Android32-Pass12"
//        let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
//        let base64Credentials = credentialData.base64EncodedString(options: [])
//        let headers = ["Authorization": "Basic \(base64Credentials)"]
//
//
//
//
//
//        Alamofire.request(URL_GET_INGREDIENTLIST, method: .get, parameters: nil, encoding: JSONEncoding.default, headers:headers) .validate().responseJSON { response in
//
////            if response.result.error == nil{
////                guard let data = response.data else { return }
////
////
////
////                do {
////                    self.ingredientDetailMyBarStructs = try JSONDecoder().decode([IngredientDetailMyBarStruct].self , from: data)
////                } catch let error {
////                    debugPrint(error as Any)
////                }
////                print(self.ingredientDetailMyBarStructs)
////            }
//
//            if response.result.error == nil {
//                guard let data = response.data else { return }
//
//                if let json = JSON(data: data).array {
//                    print(json)
//                    for item in json {
//                        let id = item["id"].intValue
//                        let name = item["nameGrouped"].stringValue
//                        let imageName = item["imageName"].stringValue
//                        let voltage = item["voltage"].doubleValue
//                        let ingredientDetailMyBarStruct = IngredientDetailMyBarStruct(id: id, name: name, imageName: imageName, voltage: voltage)
//                        self.ingredientDetailMyBarStructs.append(ingredientDetailMyBarStruct)
//                    }
//                    print(self.ingredientDetailMyBarStructs[2].name)
//                    completion(true)
//                }
//
//
//                }else {
//                    completion(false)
//                    debugPrint(response.result.error as Any)
//                }
//
//
//
//
////                if response.result.value != nil{
////                    print(response)
////                }else{
////
////                }
//        }
//
//
//
//
//
//    }
//
    
    
    
    
}
