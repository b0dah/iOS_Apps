
import UIKit
import CoreData

class ViewController: UIViewController {
    
    var message = "initialization value"
 
    @IBOutlet var messageField: UITextField!
    
    override func viewDidLoad() {
        fetchData()
        messageField.text = message
        
        super.viewDidLoad()
        
        /*let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let device = Device(entity: Device.entity(), insertInto: context)
        
        device.setValue("iPad", forKey: "name")
        device.setValue("Tablet", forKey: "deviceType")
        
        do {
            try context.save()
        }
        catch let error as NSError {
            print("Couldn't save \(error.userInfo) due to the \(error)")
        }
        
        ///////
        var DEVICE : Device
        
        let context2 = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            let result = try context2.fetch(Device.fetchRequest())
            
            DEVICE = result as! Device
        }
        catch let error as NSError {
            print("Couldn't save \(error.userInfo) due to the \(error)")
        }
        
        
        print(DEVICE)*/
    }
    
    
    @IBAction func saveDataAction(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "TestEntity", in: context)
        let newEntity = NSManagedObject(entity: entity!, insertInto: context)
        
        newEntity.setValue(messageField.text, forKey: "message")
        
        do {
            try context.save()
            print("saved")
        } catch {
            print("failed saving")
        }
        
    }
    
    func fetchData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "TestEntity")
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request)  
            
            for data in result as! [NSManagedObject] {
                message = data.value(forKey: "message") as! String
                
                print("fetched : ", message)
            }
        } catch  {
            print("fetching failed")
        }
    }
    
}

