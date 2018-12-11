//
//  ViewController.swift
//  messanger
//
//  Created by Иван on 04/12/2018.
//  Copyright © 2018 Иван. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

let AccessToken = "feedf9c66b9b06093011790d823c82344bf7e12569c6c54acb482a16335875c9f5b32ed588a8a1186f28e"


func getJSONvalue(url: String) -> JSON
{
    //var result_has_got: Bool = false
    
    var result: JSON = JSON()
    
    AF.request(url, method: .get).validate().responseJSON {
        response in
        
        switch response.result {
        case .success(let value):
            let json = JSON(value)
            result = json
            //result_has_got = true
            print("JSON: \(json)")
        case .failure(let error):
            print(error)
        }
        return
    }
    

    return result
}

func get_ts(url: String) -> String{
    
    var result = "1"
    
    AF.request(url, method: .get).validate().responseJSON { // gettin ts
        response in
        
        switch response.result {
        case .success(let value):
            let json = JSON(value)
            //print("JSON: \(json)")
            result = json["response"]["ts"].stringValue
        case .failure(let error):
            print(error)
        }
    }

    return result
}

//0000000 C L A S S 00000000000000000000000
class ViewController: UIViewController {
    
    var messagesList : [Int: String] = [:]
    var ts: String = "1837157554"
    
    @IBOutlet weak var TableView: UITableView!
    /**/@IBAction func getTS(_ sender: Any) {
        let LongPollUrl = "https://api.vk.com/method/messages.getLongPollServer?need_pts=1&lp_version=3&v=5.92&access_token=\(AccessToken)"
        
        AF.request(LongPollUrl, method: .get).validate().responseJSON { // gettin ts
         response in
         
         switch response.result {
         case .success(let value):
             let json = JSON(value)
             //print("JSON: \(json)")
             print("  * inside 1st closure *   ")
             self.ts = json["response"]["ts"].stringValue
            print("  * got zz\(self.ts)zz")
         case .failure(let error):
            print(error)
            }
        }
        print("  * 1st func ends *   ")
    }
    
/**/@IBAction func getMessages(_ sender: Any) {
    
        self.ts = "1837157893"
        //if self.ts == "1837157301" {print("**equal**")}
        print(self.ts)

        var LongPollHistoryUrl = "https://api.vk.com/method/messages.getLongPollHistory?msgs_limit=210&v=5.92&access_token=\(AccessToken)"
    
        LongPollHistoryUrl += "&ts=\(self.ts)"
        print(LongPollHistoryUrl)
        
        AF.request(LongPollHistoryUrl, method: .get).validate().responseJSON {
            response in
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
               
                //              print("JSON: \(json)")
                
                let n = json["response"]["messages"]["count"].intValue
                print(" * n = \(n)")
                
                for i in 0..<n {
                    /*wr*/self.messagesList[json["response"]["messages"]["items"][i]["from_id"].intValue] = json["response"]["messages"]["items"][i]["text"].stringValue
                }
                //      self.messagesList.appEnd(json1["response"]["messages"]["items"][1]["text"].stringValue)
                
                print(self.messagesList)

            case .failure(let error):
                print(error)
            }
        }
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //------------------
        //let url: String = "https://httpbin.org/get"
        //var url: String = "https://api.vk.com/method/users.get?user_id=210700286&v=5.52"
        //var url: String = "https://api.vk.com/method/messages.getHistory?user_id=bodah&v=5.52"
        
        
       
        
                //..........................................
        
            /*mess*//*AF.request(LongPollHistoryUrl, method: .get).validate().responseJSON { // getting messages List
                    response in
                    switch response.result {
                    case .success(let value1):
                        let json1 = JSON(value1)
                                //print("JSON: \(json1)")
         
                    case .failure(let error):
                        print(error)
                    }
                }*/
        
        
        //print(get_ts(url: LongPollUrl))
        //print(getJSONvalue(url: LongPollUrl))
        print(ts)
    // Do any additional setup after loading the view, typically from a nib.
    }
    
}

