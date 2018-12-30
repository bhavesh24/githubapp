//
//  UsersAPI.swift
//  TestYoozoo
//
//  Created by Bhavesh on 29/12/18.
//  Copyright © 2018 Bhavesh. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD

class UsersAPI: NSObject {
    weak var testYoozooDelegate : testYoozooDelegate?
    func getUsers(searchString:String) {
        
        var url = "https://api.github.com/search/users?q=\(searchString)&page=1"
        SVProgressHUD.show()
        SVProgressHUD.setDefaultMaskType(.black)
        
        if(url.contains(" "))
        {
            url = url.replacingOccurrences(of: " ", with: "%20")
        }
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .validate()
            .responseJSON {
                response in
                switch response.result {
                case .success:
                    print(response)
                    do {
                                                let userInfo: UserInfo = try JSONDecoder().decode(UserInfo.self, from: response.data!)
                                                self.testYoozooDelegate?.UserInfo(userInfo: userInfo)
                        
                    }catch{}
                    SVProgressHUD.dismiss()
                    break
                case .failure( _):
                    SVProgressHUD.dismiss()

                    self.testYoozooDelegate?.failMessage(message: "There seems to be an issue with the API!!")

                }
        }
        
    }
    func getUser(searchString:String) {
        
        var url = "https://api.github.com/users/\(searchString)"
        SVProgressHUD.show()
        SVProgressHUD.setDefaultMaskType(.black)
        
        if(url.contains(" "))
        {
            url = url.replacingOccurrences(of: " ", with: "%20")
        }
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .validate()
            .responseJSON {
                response in
                switch response.result {
                case .success:
                    print(response)
                    do {
                        let userInfo: UserDetails = try JSONDecoder().decode(UserDetails.self, from: response.data!)
                        self.testYoozooDelegate?.UserDetails(userDetails: userInfo)
                        
                    }catch{}
                    SVProgressHUD.dismiss()
                    break
                case .failure( _):
                    SVProgressHUD.dismiss()
                    
                    self.testYoozooDelegate?.failMessage(message: "There seems to be an issue with the API!!")
                    
                }
        }
        
    }
    
    func getFollowers(searchString:String) {
        
        var url = "https://api.github.com/users/\(searchString)/followers"
        SVProgressHUD.show()
        SVProgressHUD.setDefaultMaskType(.black)
        
        if(url.contains(" "))
        {
            url = url.replacingOccurrences(of: " ", with: "%20")
        }
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .validate()
            .responseJSON {
                response in
                switch response.result {
                case .success:
                    print(response)
                    do {
                        let userInfo: [Items] = try JSONDecoder().decode([Items].self, from: response.data!)
                        self.testYoozooDelegate?.UserInfo(userInfo: userInfo)
                        
                    }catch{}
                    SVProgressHUD.dismiss()
                    break
                case .failure( _):
                    SVProgressHUD.dismiss()
                    self.testYoozooDelegate?.failMessage(message: "There seems to be an issue with the API!!")
                    
                }
        }
        
    }
    
    
}
