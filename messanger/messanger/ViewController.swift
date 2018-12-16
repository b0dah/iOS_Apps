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
//let AccessToken = "e27e3b2027a0669340127c4b6be131371ebb1b73506c9a709ede07756538f9cf9f9772c60daff19f00b3e" // yota

func getJSONvalue(url: String) -> JSON
{
    //var result_has_got: Bool = false
    
    //let url = "https://jsonplaceholder.typicode.com/posts"
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
    }.resume()
    

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

func getNamewithID(id: String) -> String {
    let queue = DispatchQueue(label: "com.cnoon.response-queue", qos: .utility, attributes: [.concurrent])
    
    let Url = "https://api.vk.com/method/users.get?user_id=210700286&v=5.92&access_token=\(AccessToken)"
    var name = ""
    
    AF.request(Url, method: .get).validate().responseJSON {
        response in
        
        switch response.result {
        case .success(let value):
            let json = JSON(value)
            print("aii **")
            name = json["response"][0]["first_name"].stringValue
            
        case .failure(let error):
            print(error)
        }
    }
    return name
}


//0000000 C L A S S 00000000000000000000000
class ViewController: UIViewController, UITableViewDataSource {
    
    var IDsList: [String] = []
    var messagesList : [String] = []
    var ts: String = "1837158783"
    var ind = 0
    
    @IBOutlet weak var tableView: UITableView!
    
    
    /**/@IBAction func getTS(_ sender: Any) {
        /*let LongPollUrl = "https://api.vk.com/method/messages.getLongPollServer?need_pts=1&lp_version=3&v=5.92&access_token=\(AccessToken)"
        
        
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
        print("name = ")
        //print(getNamewithID(id: "203674241")) */
    }
    
    
/**/@IBAction func getMessages(_ sender: Any) {
    
        //self.ts = "1837158783"
        //if self.ts == "1837157301" {print("**equal**")}
        //print(self.ts)

        var LongPollHistoryUrl = "https://api.vk.com/method/messages.getLongPollHistory?msgs_limit=210&v=5.92&access_token=\(AccessToken)"
        LongPollHistoryUrl += "&ts=\(self.ts)"
    
        
        AF.request(LongPollHistoryUrl, method: .get).validate().responseJSON {
            response in
            
            switch response.result {
                
            case .success(let value):
                let json = JSON(value)
                //              print("JSON: \(json)")
                let n = json["response"]["messages"]["count"].intValue
                
                //for i in 0..<n
                while (self.ind < n)
                {
                    //----- gettng name
                        self.IDsList.append(json["response"]["messages"]["items"][self.ind]["from_id"].stringValue)
                        //name = json["response"]["profiles"][0]["first_name"].stringValue
                    //------getting name ends
                    /*wr*/self.messagesList.append(json["response"]["messages"]["items"][self.ind]["text"].stringValue)
                    self.ind += 1
                }
                
                self.tableView.reloadData()
                //      self.messagesList.appEnd(json1["response"]["messages"]["items"][1]["text"].stringValue)
                
            case .failure(let error):
                print(error)
            }
        }
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ////////////
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
        print("name = ")
        //print(getNamewithID(id: "203674241"))
        /////////////////////////////////////////////
        
        self.tableView.dataSource = self
        
    }
    
    
    //==== methods for table view
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return messagesList.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.detailTextLabel?.text = "id" + IDsList[indexPath.row]
            cell.textLabel?.text = messagesList[indexPath.row]
            return cell
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {  // передача значения при переходе (segue) между классами
        
        if segue.identifier == "segue_to_dialog_ID" {
            if let IndexPath = self.tableView.indexPathForSelectedRow {
                var destination: DialogViewController = segue.destination as! DialogViewController // экз первого класса
                destination.personID = IDsList[IndexPath.row]
            }
        }
    }
    // Do any additional setup after loading the view, typically from a nib.
}

