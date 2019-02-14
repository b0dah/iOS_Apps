//
//  DialogViewController.swift
//  messanger
//
//  Created by Иван Романов on 16/12/2018.
//  Copyright © 2018 Иван. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

class DialogViewController: UIViewController, UITableViewDataSource {
    
    var personID = ""
    var DialogMessagesList : [String] = []
    var DialogInOrOut : [Bool] = []
    var dest = ""

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    
    /**/@IBAction func SendMessageButton(_ sender: UIButton) {
        
        let messageText = messageTextField.text!
        
        let sendMessageUrl = "https://api.vk.com/method/messages.send?user_id=\(personID)&message=\(messageText)&v=5.38&access_token=\(AccessToken)"
        
        if let encoded = sendMessageUrl.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed), // перевод в новую кодировку
            let url = URL(string: encoded) { AF.request(url) }  //          AF.request(url)
        
        //------ refreshing when sent smt new ----------
            DialogMessagesList.insert(messageText, at: 0)
            DialogInOrOut.insert(true, at: 0)
             self.tableView.reloadData()
        //------- refreshing cancelled
        messageTextField.text = ""
        
        
    }

    
    /**/override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var fb_messages_in_dialog_IDs_List : [String] = []
        
        switch dest {
        case "fb":
        // receiving mess IDs
            /*let fb_dialog_url = "https://graph.facebook.com/t_108847693502996?fields=messages&access_token=\(fb_AccessToken)"
            
            AF.request(fb_dialog_url, method: .get).validate().responseJSON { // gettin dialog
                response in
                
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    
                    //self.last_ID = json["messages"]["data"][0]["id"].stringValue
                    for i in 0..<json["messages"]["data"].count  {
                        fb_messages_in_dialog_IDs_List.append(json["messages"]["data"][i]["id"].stringValue)
                    }
                    self.title = json["id"].stringValue
                    
                    print("ARRAY")
                    print(fb_messages_in_dialog_IDs_List)
                case .failure(let error):
                    print(error)
                }
           } */
        // receiving messages
            
            for i in FB_IDs {
                let getting_fb_mess_url = "https://graph.facebook.com/\(i)?fields=message&access_token=\(fb_AccessToken)"
            
                AF.request(getting_fb_mess_url, method: .get).validate().responseJSON { // gettin dialog
                    response in
                    
                    switch response.result {
                    case .success(let value):
                        let json = JSON(value)
                        
                        
                        self.DialogMessagesList.append(json["message"].stringValue)
                        self.DialogInOrOut.append(true)
                        
                        self.tableView.reloadData()
                        
                    case .failure(let error):
                        print(error)
                    }
                }
                
                self.tableView.dataSource = self
            }
            
            
        default: // vk
            
            let getDialogMessagesUrl =  "https://api.vk.com/method/messages.getHistory?user_id=\(personID)&count=50&v=5.92&access_token=\(AccessToken)"
            AF.request(getDialogMessagesUrl, method: .get).validate().responseJSON {
                response in
                
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    //print("JSON: \(json)")
                    
                    for i in 0..<json["response"]["items"].count {
                        
                        self.DialogInOrOut.append(json["response"]["items"][i]["out"].boolValue)
                        self.DialogMessagesList.append(json["response"]["items"][i]["text"].stringValue)
                    }
                    self.tableView.reloadData()
                
                case .failure(let error):
                    print(error)
                }
            }
        //getting sender name
            var sender_name = ""
            let getting_name_url = "https://api.vk.com/method/users.get?user_id=\(personID)&v=5.92&access_token=\(AccessToken)"
            
            AF.request(getting_name_url, method: .get).validate().responseJSON {
                response in
                
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    //print("JSON: \(json)")
                    //print(json["response"][0]["first_name"].stringValue)
                     sender_name = (json["response"][0]["first_name"].stringValue)
                    self.title = String(sender_name)
                case .failure(let error):
                    print(error)
                }
            }
            
    }
    //-------------------
        self.tableView.dataSource = self
        
    // hiding keyboard
        self.hideKeyboardWhenTappedAround()
    }
    
    
//==== methods for table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DialogMessagesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_for_message_ID", for: indexPath)
        
        if DialogInOrOut[indexPath.row] { // если исходящее сообщение
            cell.detailTextLabel?.text =  DialogMessagesList[indexPath.row]
            cell.textLabel?.text = "" //id" + IDsList[indexPath.row
        }
        else
        {
            cell.detailTextLabel?.text = "" // входящее
            cell.textLabel?.text = DialogMessagesList[indexPath.row]
        }
        return cell
    }

}
