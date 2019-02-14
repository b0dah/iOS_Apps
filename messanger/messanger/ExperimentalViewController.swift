//
//  ExperimentalViewController.swift
//  messanger
//
//  Created by Иван Романов on 18/12/2018.
//  Copyright © 2018 Иван. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

var OK_AccessToken = "-s-0lxIV0Z158zsVSUE1-1rTPaKniZM-SSJ0pWpU7Wp1C.a"

class ExperimentalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*let Url = "https://api.vk.com/method/users.get?user_id=210700286&v=5.92&access_token=\(AccessToken)"
    
            AF.request(Url, method: .get).validate().responseJSON {
                response in
                
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    //print("JSON: \(json)")
                    print(json["response"][0]["first_name"].stringValue)
                    
                case .failure(let error):
                    print(error)
                }
            }*/
        
        //let get_mess_url = "https://graph.facebook.com/v2.3/me/inbox?access_token=\(fb_AccessToken)"
        let fb_ID = "2397269327165196"
        
        //let url = "https://graph.facebook.com/2397269327165196?fields=conversations100004133747259?access_token=\(fb_AccessToken)"
        //let url = "https://graph.facebook.com/v3.2/2397269327165196/conversations&access_token=EAAgSGll2YzIBAOBHGGr3LcgNLVCzPNanr5l2Ar7U3CvwmdFPrBIZCiskszXJUoKZBMeF1OS4gGF6gNGDoH84zmSsuZAbpmS6RQBB2i8EW6MWQTYkO0oc8mWPxj6XgSNqQrxtkgAjqz2WQKB6CTSZCQTOP1rOobZAyXVdnEKwebQZDZD"
        let friend_ID = "100004133747259"
        let thread_ID = "100004133747259"
        //let url = "https://graph.facebook.com/\(fb_ID)?fields=conversations\(conversation_ID)&access_token=\(fb_AccessToken)"
        //let url = "https://graph.facebook.com/v3.2/\(thread_ID)&access_token=\(fb_AccessToken)"
        
        /*let url = "https://api.ok.ru/oauth/token.do?code=14JoLW8sb40GDPBoTy7bv4ubWcJCgPnObbKGOvofp0h8avuxg7tNW0zOwY67TMZrvnZGMKyermony8t79RNSDu2n0gDncVzN2OtVIMGkLyO9vkik5xgDBbMixGyvbJsoHPGj8K3RpZSsqcmZGPNd9g7SpviOqn7VruqvvSi0P6Xu0K2&client_id=1274364160&client_secret=90794CB70A6B5AF45A9568E7&redirect_uri=https://ok.ru&grant_type=authorization_code"
        
        AF.request(url, method: .post).validate().responseJSON {
            response in
            
            switch response.result {
                case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                case .failure(let error):
                print(error)
            }
        }*/
        let refresh_token = "d02639435451_a68823813cf0c121052d27360544d772_57880672199c"
        let client_id = "1274364160"
        let client_secret = "90794CB70A6B5AF45A9568E7"
        let grant_type = "refresh_token"
        
        let refreshTokenUrl = "https://api.ok.ru/oauth/token.do?refresh_token=\(refresh_token)&client_id=\(client_id)&client_secret=\(client_secret)&grant_type=\(grant_type)"
        
        
        let sub_url = "https://api.ok.ru/graph/me/subscribe?access_token=tkn1UZ7pGmvsDWFcBH315XxuSJT4Qg15Ju8YmiETxz3d3pWpYRk3xEYtY3RHCHoSWTz20:CBABEGPMEBABABABA"
        
        var getMessUrl = "https://api.ok.ru/graph/me/messages/chat:C3f1b4de5ad00?access_token=tkn1UZ7pGmvsDWFcBH315XxuSJT4Qg15Ju8YmiETxz3d3pWpYRk3xEYtY3RHCHoSWTz20:CBABEGPMEBABABABA"
        
        //var getMessUrl = "https://api.ok.ru/graph/me/chats?access_token=tkn1UZ7pGmvsDWFcBH315XxuSJT4Qg15Ju8YmiETxz3d3pWpYRk3xEYtY3RHCHoSWTz20:CBABEGPMEBABABABA&count=1"
       
        if let encoded = sub_url.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed), // перевод в новую кодировкцу
            let url = URL(string: encoded) {
        
            AF.request(sub_url, method: .post).validate(contentType: ["application/json"]).responseJSON {
                response in
                
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    print("JSON: \(json)")
                    
                case .failure(let error):
                    print(error)
                }
            }
        }
    
    }
   

}
