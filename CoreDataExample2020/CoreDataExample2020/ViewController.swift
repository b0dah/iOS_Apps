//
//  ViewController.swift
//  CoreDataExample2020
//
//  Created by Иван Романов on 08.05.2020.
//  Copyright © 2020 Иван Романов. All rights reserved.
//

import CoreData
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    // properties
    var people: [NSManagedObject] = []
    
    @IBAction func addItemButtonTapped(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "New Name", message: "Add a new name", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { [unowned self] action in
            
            guard let textField = alert.textFields?.first,
                let nameToSave = textField.text else {
                    return
            }
            
            self.savePersonInstance(name: nameToSave)
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    func savePersonInstance(name: String) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        /*1*/let managedContext = appDelegate.persistentContainer.viewContext
        
        /*2*/let personEntity = NSEntityDescription.entity(forEntityName: "Person", in: managedContext)!
        
        let person = NSManagedObject(entity: personEntity, insertInto: managedContext)
        
        /*3*/person.setValue(name, forKey: "name")
        
        /*4*/
        do {
            try managedContext.save()
            people.append(person)
        } catch let error as NSError {
            print("Couldn't save due to the \(error) \(error.userInfo)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.title = "Names"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
        
        do {
            try people = managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Couldn't fetch \(error) \(error.userInfo)")
        }
    }
    
}
    // MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let person = people[indexPath.row]
        cell.textLabel?.text = person.value(forKey: "name") as? String
        
        return cell
    }
}
    




