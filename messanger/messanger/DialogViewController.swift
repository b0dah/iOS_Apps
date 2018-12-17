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

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    
    /**/@IBAction func SendMessageButton(_ sender: UIButton) {
        
        let messageText = messageTextField.text!
        
        let sendMessageUrl = "https://api.vk.com/method/messages.send?user_id=\(personID)&message=\(messageText)&v=5.38&access_token=\(AccessToken)"
        
        if let encoded = sendMessageUrl.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed), // перевод в новую кодировкцу
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
        
        self.title = String("id"+personID)
        
        /* getting name
        let Url = "https://api.vk.com/method/users.get?user_id=\(personID)&v=5.92&access_token=\(AccessToken)"
        
        AF.request(Url, method: .get).validate().responseJSON {
            response in
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                let name: String = json["response"][0]["first_name"].stringValue
                self.title = name
                
            case .failure(let error):
                print(error)
            }
        }
    }*/
        
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
        self.tableView.dataSource = self
        
    // hiding keyboard
        self.hideKeyboardWhenTappedAround()

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
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
