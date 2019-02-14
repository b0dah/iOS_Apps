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

//let AccessToken = "feedf9c66b9b06093011790d823c82344bf7e12569c6c54acb482a16335875c9f5b32ed588a8a1186f28e" // beeline
let AccessToken = "e27e3b2027a0669340127c4b6be131371ebb1b73506c9a709ede07756538f9cf9f9772c60daff19f00b3e" // yota

let fb_AccessToken = "EAAgSGll2YzIBAEwZA98YuoXBYZAgF1UpjcJEhZBfzhRZBeBNw1hoZAOY2orgLcvPI9EWqF9gcWiHKiEZBX9hlLaoZBG44YNOlcFYKFsf1KdGdnsyuwef9tZCZBRdhon1XZAWDai71pSTK6ZAFKjPlEs6cXAWV2ZBZB7LTjoa9dKPHZAkj8ZAgZDZD"
var ts: String = "1837158783"
var server = ""
var key = ""

var FB_IDs : [String] = []

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

func getNamewithID(id: String) -> String {
    
    let Url = "https://api.vk.com/method/users.get?user_id=210700286&v=5.92&access_token=\(AccessToken)"
    var name = ""
    
    let queue = DispatchQueue(label: "com.cnoon.manager-response-queue",
                              qos: .userInitiated,
                              attributes:.concurrent)
    
    AF.request(Url, method: .get,
        parameters: ["foo": "bar"],
        encoding: JSONEncoding.default,//by default
        headers: ["Content-Type":"application/json; charset=UTF-8"])
        .validate(statusCode: 200..<300).responseJSON(queue: queue, options: .allowFragments,
                 completionHandler: { (response:DataResponse<Any>) in
                    
                    switch(response.result) {
                    case .success(let value):
                        let json = JSON(value)
                        break
                    case .failure(_):
                        print(response.result.error)
                        if response.result.error?._code == NSURLErrorTimedOut{
                            //TODO: Show Alert view on netwok connection.
                        }
                        break
                    }
    })
    
    return name
}


//0000000 C L A S S 00000000000000000000000
class ViewController: UIViewController, UITableViewDataSource {
    
    var IDsList: [String] = []
    var messagesList : [String] = []
    var namesList: [String] = []
    var labelsList: [String] = []
    var destList: [String] = []
    
    
    var ind = 0
    
    var fb_last_count: Int = 0
    var fb_received_mess_count: Int = 0
    var last_ID = ""
    var fb_Sender_ID = ""
    
    @IBOutlet weak var tableView: UITableView!
    
/**/@IBAction func getMessages(_ sender: Any) {
    
        //self.ts = "1837158783"
        //if self.ts == "1837157301" {print("**equal**")}
        //print(self.ts)

        var LongPollHistoryUrl = "https://api.vk.com/method/messages.getLongPollHistory?msgs_limit=210&v=5.92&access_token=\(AccessToken)"
        LongPollHistoryUrl += "&ts=\(ts)"
    
        
        AF.request(LongPollHistoryUrl, method: .get).validate().responseJSON {
            response in
            
            switch response.result {
                
            case .success(let value):
                let json = JSON(value)
                   //           print("JSON: \(json)")
                let n = json["response"]["messages"]["count"].intValue
                
                //for i in 0..<n
                while (self.ind < n)
                {
                
                    self.IDsList.append(json["response"]["messages"]["items"][self.ind]["from_id"].stringValue)
                    self.labelsList.append("(*VK*) " + "id" + json["response"]["messages"]["items"][self.ind]["from_id"].stringValue)
                    self.destList.append("vk")
                    
                    /*wr*/self.messagesList.append(json["response"]["messages"]["items"][self.ind]["text"].stringValue)
                    self.ind += 1
                }
                self.tableView.reloadData()
              
                //      self.messagesList.appEnd(json1["response"]["messages"]["items"][1]["text"].stringValue)
                
            case .failure(let error):
                print(error)
            }
        }
    
    //getting names
        /*namesList = Array(repeating: "", count: messagesList.count)
        for i in 0..<messagesList.count {
            
            
            let getting_name_url = "https://api.vk.com/method/users.get?user_id=\(IDsList[i])&v=5.92&access_token=\(AccessToken)"
     
            AF.request(getting_name_url, method: .get).validate().responseJSON {
                response in
     
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    //print("JSON: \(json)")
                    //print(json["response"][0]["first_name"].stringValue)
                    self.namesList[i] = (json["response"][0]["first_name"].stringValue)
     
                case .failure(let error):
                    print(error)
                }
                if i == self.IDsList.count - 1 { self.tableView.reloadData() }
            }
        }*/
    
    //////////// FB ////////////////////////////////
        /*(let getting_fb_dialog_url = "https://graph.facebook.com/t_108847693502996?fields=messages&access_token=\(fb_AccessToken)"
        var fb_mess_IDs : [String] = []
    
            AF.request(getting_fb_dialog_url, method: .get).validate().responseJSON { // gettin dialog
                response in
                
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    
                    print("New count = : \(json["messages"]["data"].count)")
                    
                    self.fb_received_mess_count = json["messages"]["data"].count - self.fb_last_count
                    if self.fb_received_mess_count > 0
                        {
                        for i in 0..<self.fb_received_mess_count {
                            fb_mess_IDs.append(json["messages"]["data"][i]["id"].stringValue)
                            print("get IDs")
                        }
                    }
                    
                    //print("lat count = \(self.fb_last_count)")
                case .failure(let error):
                    print(error)
                }
            }*/
    
    
        //GETTING FACEBOOK MESSAGES

            let getting_fb_mess_url = "https://graph.facebook.com/\(self.last_ID)?fields=message&access_token=\(fb_AccessToken)"
        
            AF.request(getting_fb_mess_url, method: .get).validate().responseJSON { // gettin dialog
                response in
                
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                 
                    self.messagesList.append(json["message"].stringValue)
                    self.IDsList.append(self.fb_Sender_ID)
                    self.labelsList.append("(*FB*) " + "id" + self.fb_Sender_ID)
                    self.destList.append("fb")
                    
                    self.tableView.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = String("Current Messages")
        
        ///////GETTING VK TS/////
        let LongPollUrl = "https://api.vk.com/method/messages.getLongPollServer?need_pts=1&lp_version=3&v=5.92&access_token=\(AccessToken)"
        
        
        AF.request(LongPollUrl, method: .get).validate().responseJSON { // gettin ts
            response in
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                ts = json["response"]["ts"].stringValue
                server = json["response"]["server"].stringValue
                key = json["response"]["key"].stringValue
            
            case .failure(let error):
                print(error)
            }
        }
        
    //////// GETTING FB DIALOGS //////////
        
      
        
        let fb_dialog_url = "https://graph.facebook.com/t_108847693502996?fields=messages&access_token=\(fb_AccessToken)"
        
        AF.request(fb_dialog_url, method: .get).validate().responseJSON { // gettin dialog
            response in
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                self.last_ID = json["messages"]["data"][0]["id"].stringValue //
                self.fb_Sender_ID = json["id"].stringValue                  //
                //self.last_ID = json["messages"]["data"][0]["id"].stringValue
                for i in 0..<json["messages"]["data"].count  {
                    FB_IDs.append(json["messages"]["data"][i]["id"].stringValue)
                }
                
            case .failure(let error):
                print(error)
            }
        }
     /////////////////////////////////////
        self.tableView.dataSource = self
        
    }
    
    
    //==== methods for table view
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return messagesList.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.detailTextLabel?.text = /*namesList[indexPath.row]*/ labelsList[indexPath.row]
            cell.textLabel?.text = messagesList[indexPath.row]
            return cell
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {  // передача значения при переходе (segue) между классами
        if segue.identifier == "segue_to_dialog_ID" {
            if let IndexPath = self.tableView.indexPathForSelectedRow {
                var destination: DialogViewController = segue.destination as! DialogViewController // экз первого класса
                destination.personID = IDsList[IndexPath.row]
                destination.dest = destList[IndexPath.row]
            }
        }
    }
    // Do any additional setup after loading the view, typically from a nib.
}

