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
import AlamofireImage


class IngredientService {
    
    static let instance =  IngredientService()
    
    var ingredientNonAlcoDetailMyBarStructs = [IngredientDetailMyBarStruct]()
    var ingredientAlcoDetailMyBarStructs = [IngredientDetailMyBarStruct]()
    var ingredientAllDetail : IngredientDetail!
    //var ingredientAllDetail : IngredientDetail!
    
    
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
                
//                var imag = UIImage(named : "absinthe")
//
//                Alamofire.request("\(BASE)/assets/ingred/full/\(imageName!)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers:headers) .validate().responseImage { response in
//
//                    imag = response.result.value!
//                }
//
                
                
                let voltage = item["voltage"] as! String

                let ingredientNonAlcoDetailMyBarStructs = IngredientDetailMyBarStruct(id: id , name: name, imageName: imageName , voltage: voltage)
                self.ingredientNonAlcoDetailMyBarStructs.append(ingredientNonAlcoDetailMyBarStructs)
            
            }
            completion(true)
        }
    }
    
    
    
    
    //  IMAGE NON ALCO
    func findNonAlcoIngImg(completion: @escaping CompletionHandler) {
        
        
        
//        let imageName : String! = "1150.jpg"
//
//        DataRequest.addAcceptableImageContentTypes(["image/jpg"]) // add jpg
//        Alamofire.request("\(BASE)/assets/ingred/full/\(imageName!)").responseImage(completionHandler: { (response) in
//            print("PESPESPEPSPEPSPESPESPEPSPEPSPESPESPEPSPEPSPESPESPEPSPEPSPESPESPEPSPEPSPESPESPEPSPEPSPESPESPEPSPEPSPESPESPEPSPEPS")
//            //print(response)
//            debugPrint(response)
//            var imag = response.result.value
//            //print(imag)
//
//        })
        
        
        
        
        
        

        //passwords, usernames, login
        let user = "=="
        let password = "=="
        let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers = ["Authorization": "Basic \(base64Credentials)"]
        
        let imageName : String! = "1150.jpg"
        Alamofire.request("\(BASE)/assets/ingred/full/\(imageName!)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers:headers) .validate().responseImage { response in
            print("WWWWWWWW")
            debugPrint(response)
            print("EEEEEEEE")
            let imag = response.result.value!
            print(response.result.value!)
            
//            print(Result) as Any as UIImage!
        }
        
        
        
//
//        Alamofire.request(FULL_URL_INGREDIENTLIST_NON_ALCO, method: .get, parameters: nil, encoding: JSONEncoding.default, headers:headers) .validate().responseJSON { (response) in
//
//            guard let json = response.result.value as? Dictionary<String, AnyObject> else { return }
//
//            let ingrDict = json["list"] as! Array<NSDictionary>
//            for item in ingrDict {
//
//                let id = item["id"] as! Int
//                let name = item["nameGrouped"] as! String
//                let imageName : String! = item["imageName"] as! String
//            }
//            completion(true)
//        }
        
        
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
    
    
    //    DETAIL INGREDIENTS
    func findDetailIngredients(ingredientId: Int ,completion: @escaping CompletionHandler) {
        
        //passwords, usernames, login
        let user = "=="
        let password = "=="
        let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers = ["Authorization": "Basic \(base64Credentials)"]
        
        let DETAIL_URL : String = "\(INGREDIENT_DETAIL_BASE)\(ingredientId)"
        
        Alamofire.request(DETAIL_URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers:headers) .validate().responseJSON { (response) in
            
            guard let json = response.result.value as? Dictionary<String, AnyObject> else { return }
            
            let ingr = json["ingredient"] as! Dictionary<String, AnyObject>
            
            let id = ingr["id"] as! Int
            let name = ingr["nameGrouped"] as! String           //IMPORTANT: not name, because of: in list is only nameGrouped, and I compare name and nameGrouped and they are different
            let nameGrouped = ingr["nameGrouped"] as! String
            let voltage = ingr["voltage"] as! String
            let description = ingr["description"] as! String
            let imageName : String! = ingr["imageName"] as! String
            let imageNameString = imageName!    //help variable
            let imageUrl = "\(BASE)/assets/ingred/full/\(imageNameString)"
            let numShowed = ingr["numShowed"] as! Int
            //let ingredientType = ingr["ingredientType"] as! IngredientType
            
            self.ingredientAllDetail = IngredientDetail(id: id , name: name, nameGrouped: nameGrouped, voltage: voltage, description: description, imageName: imageName, imageUrl: imageUrl, numShowed: numShowed) //, ingredientType: ingredientType
                
  //          print(self.ingredientAllDetail.imageUrl, self.ingredientAllDetail.description, self.ingredientAllDetail.name)

            completion(true)
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // INGREDIENT IMAGEDOWNLOAD
    func findIngredientImage(imageName: String ,completion: @escaping CompletionHandler) {
        
        //passwords, usernames, login
        let user = "=="
        let password = "=="
        let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers = ["Authorization": "Basic \(base64Credentials)"]
        
        let BIG_INGREDIENT_IMAGE : String = "\(BASE_INGREDIENT_IMG)\(imageName)"
        
        print("ee: \(BIG_INGREDIENT_IMAGE)")
        
        //var imag = UIImage(named : "absinthe")
        
        Alamofire.request(BIG_INGREDIENT_IMAGE, method: .get, parameters: nil, encoding: JSONEncoding.default, headers:headers) .validate().responseImage { response in
            //print(response)
            mainImag = response.result.value
            print(mainImag.cgImage)
            
            completion(true)

        }
    }
    
    
    // COLLECTION IMAGEDOWNLOAD
    func findIngredientCollectionImage(imageName: String ,completion: @escaping CompletionHandler) {
        
        //passwords, usernames, login
        let user = "=="
        let password = "=="
        let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers = ["Authorization": "Basic \(base64Credentials)"]
        
        let BIG_INGREDIENT_IMAGE : String = "\(BASE_INGREDIENT_IMG)\(imageName)"
        
        print("ee: \(BIG_INGREDIENT_IMAGE)")
        
        //var imag = UIImage(named : "absinthe")
        
        Alamofire.request(BIG_INGREDIENT_IMAGE, method: .get, parameters: nil, encoding: JSONEncoding.default, headers:headers) .validate().responseImage { response in
            //print(response)
            var helpImg : UIImage
            helpImg = response.result.value!
            print(helpImg.cgImage)
            
            completion(true)
            
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    //    IMAGE INGREDIENTS
    func findImgIngredients(completion: @escaping CompletionHandler) {
        
        //passwords, usernames, login
        let user = "=="
        let password = "=="
        let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers = ["Authorization": "Basic \(base64Credentials)"]
        
//        let DETAIL_URL : String = "\(INGREDIENT_DETAIL_BASE)\(ingredientId)"
//
//        Alamofire.request(DETAIL_URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers:headers) .validate().responseJSON { (response) in
//
//            guard let json = response.result.value as? Dictionary<String, AnyObject> else { return }
//
//            let ingr = json["ingredient"] as! Dictionary<String, AnyObject>
//
//            let id = ingr["id"] as! Int
//            let name = ingr["name"] as! String
//            let nameGrouped = ingr["nameGrouped"] as! String
//            let voltage = ingr["voltage"] as! String
//            let description = ingr["description"] as! String
//            let imageName : String! = ingr["imageName"] as! String
//            let imageNameString = imageName!    //help variable
//            let imageUrl = "\(BASE)/assets/ingred/full/\(imageNameString)"
//            let numShowed = ingr["numShowed"] as! Int
//            //let ingredientType = ingr["ingredientType"] as! IngredientType
//
//            self.ingredientAllDetail = IngredientDetail(id: id , name: name, nameGrouped: nameGrouped, voltage: voltage, description: description, imageName: imageName, imageUrl: imageUrl, numShowed: numShowed) //, ingredientType: ingredientType
//
//            print(self.ingredientAllDetail.imageUrl, self.ingredientAllDetail.description, self.ingredientAllDetail.name)
//
//            completion(true)
//        }
//
        

        
        
    }
    

}
