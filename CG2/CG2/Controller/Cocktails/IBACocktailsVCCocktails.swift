//
//  IBACocktailsVCCocktails.swift
//  CG2
//
//  Created by Tomáš Dobrotka on 09/03/2018.
//  Copyright © 2018 Tomáš Dobrotka. All rights reserved.
//

import UIKit
import XLPagerTabStrip
class IBACocktailsVCCocktails: UITableViewController {

    
    var cocktailList = CocktailList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // print("[1]Vypise sa len raz, a to vtedy ked prvy krat po zapnuti appky prejdem na tento controller")

        cocktailList.downloadCocktailList {
            //setup UI to load downloaded data
        }

        
      // let jsonUrlString = "https://46.101.103.73:8443/cocktail/list?pageNumber=0&pageSize=100"
      //  let jsonUrlString = "https://api.coindesk.com/v1/bpi/currentprice.json"
        
        
      //  let jsonUrlString = "https://www.footyapps.com:8443/cocktail/list?pageNumber=0&pageSize=100"
        
//        let jsonUrlString = "https://www.footyapps.com/cocktail/list?pageNumber=0&pageSize=100"
//
//        guard let url = URL(string: jsonUrlString) else { return }
//
//        URLSession.shared.dataTask(with: url) { (data , response, err) in
//            //check error
//            //check response status 200 OK
//
//            guard let data = data else { return }
//
//            let dataAsString = String(data: data, encoding: .utf8)
//            print(dataAsString)
//
//
//        }.resume()

        
        
 
        
      
        
    }
    
//    public func URLSession(session: URLSession, didReceiveChallenge challenge: URLAuthenticationChallenge,
//                           completionHandler: (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
//        // Verify that challenge did come from our API server.
//        if ApiSecurity.sharedInstance.protectionSpaceVerified(challenge.protectionSpace){
//            let credentials = URLCredential(forTrust: challenge.protectionSpace.serverTrust!)
//            completionHandler(URLSession.AuthChallengeDisposition.UseCredential, credentials)
//        }
//        else{
//            completionHandler(URLSession.AuthChallengeDisposition.CancelAuthenticationChallenge, nil)
//        }
//    }
//    
//    func protectionSpaceVerified(protectionSpace:URLProtectionSpace)->Bool{
//        var verified = true
//        verified = verified && (protectionSpace.host.compare(ApiSecurity.apiHost,
//                                                             options: [.CaseInsensitiveSearch], range: nil, locale: nil) == .OrderedSame)
//        if (ApiSecurity.enforceSsl){
//            verified = verified && (protectionSpace.port == 443)
//        }
//        return verified
//    }

    
    
    
    
//    func connection(connection: NSURLConnection, canAuthenticateAgainstProtectionSpace protectionSpace: URLProtectionSpace?) -> Bool {
//        return protectionSpace?.authenticationMethod == NSURLAuthenticationMethodServerTrust
//    }
//
//    func connection(connection: NSURLConnection, didReceiveAuthenticationChallenge challenge: URLAuthenticationChallenge?) {
//        if challenge?.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust
//        {
//            if challenge?.protectionSpace.host == "https://46.101.103.73:8443/cocktail/list?pageNumber=0&pageSize=100"
//            {
//                let credentials = URLCredential(trust: challenge!.protectionSpace.serverTrust!)
//                challenge!.sender?.use(credentials, for: challenge!)
//            }
//        }
//
//        challenge?.sender?.continueWithoutCredential(for: challenge!)
//    }
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellOne", for: indexPath) as! TableViewCellOne

        return cell
    }
    

}

extension IBACocktailsVCCocktails : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "INTRO")
    }
}


