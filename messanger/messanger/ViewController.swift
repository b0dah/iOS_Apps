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
class ViewController: UIViewController, UITableViewDataSource {
    
    var messagesList : [String] = []
    var ts: String = "1837158783"
    var ind = 0
    
    @IBOutlet weak var tableView: UITableView!
    
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
    
        //self.ts = "1837158783"
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
                
                //for i in 0..<n
                while (self.ind < n)
                {
                    /*wr*/self.messagesList.append(json["response"]["messages"]["items"][self.ind]["text"].stringValue)
                    self.ind += 1
                }
                
                
                print(self.messagesList)
                
                self.tableView.reloadData()
                //      self.messagesList.appEnd(json1["response"]["messages"]["items"][1]["text"].stringValue)
            case .failure(let error):
                print(error)
            }
        }
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        
    }
        //==== methods for table view
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return messagesList.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = messagesList[indexPath.row]
            return cell
        }
    
        
        
        //print(ts)
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

