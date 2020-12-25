/*:
 [Previous](@previous)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Next](@next)
 
 # Model-View-ViewModel (MVVM)
 - - - - - - - - - -
 ![MVVM Diagram](MVVM_Diagram.png)
 
 The Model-View-ViewModel (MVVM) pattern separates objects into three types: models, views and view-models.
 
 - **Models** hold onto application data. They are usually structs or simple classes.
 - **View-models** convert models into a format that views can use.
 - **Views** display visual elements and controls on screen. They are usually subclasses of `UIView`.
 
 ## Code Example
 */
import PlaygroundSupport
import UIKit

// MARK:- Model
public final class Pet {
    public enum Rarity {
        case common
        case uncommon
        case rare
        case veryRare
    }
    
    public let name: String
    public let birthday: Date
    public let rarity: Rarity
    public let image: UIImage
    
    public init(name: String,
         birthday: Date,
         rarity: Rarity,
         image: UIImage) {
        self.name = name
        self.birthday = birthday
        self.rarity = rarity
        self.image = image
    }
}

// MARK:- View Model
public final class PetViewModel {
    
    // MARK:- Private Properties
    private let pet: Pet
    private let calendar: Calendar
    
    public init(pet: Pet) {
        self.pet = pet
        self.calendar = Calendar(identifier: .gregorian)
    }
    
    // MARK:- Public Properties
    // 1
    public var nameText: String {
        return pet.name
    }
    
    public var image: UIImage {
        return pet.image
    }
    
    // 2
    public var ageText: String {
        
        var stringAge = String()
        
        let today = calendar.startOfDay(for: Date())
        let birtday = calendar.startOfDay(for: pet.birthday)
        let components = calendar.dateComponents([.year], from: birtday, to: today)
        
        if let age = components.year {
            stringAge = "\(age) years old"
        } else {
            stringAge = "N/A years old"
        }
        
        return stringAge
    }
    
    public var adoptionFeeText: String {
        var price = 0
        
        switch pet.rarity {
        case .common:
            price = 50
        case .uncommon:
            price = 100
        case .rare:
            price = 200
        case .veryRare:
            price = 1000
        default:
            price = 0
        }
        
        return "\(price)$"
    }
    
    public func configure(_ view: PetView) {
        // Setting Properties
        view.nameLabel.text = viewModel.nameText
        view.imageView.image = viewModel.image
        view.ageLabel.text = viewModel.ageText
        view.adoptionFeeLabel.text = viewModel.adoptionFeeText
    }
}

// MARK:- View
public final class PetView: UIView {
    // MARK:- Private Properties
    private let padding: CGFloat = 16
    
    // MARK:- Public Properties
    public let imageView: UIImageView
    public let nameLabel: UILabel
    public let ageLabel: UILabel
    public let adoptionFeeLabel: UILabel
    
    public override init(frame: CGRect) {
        // iv
        var childFrame = CGRect(x: 0, y: padding, width: frame.width, height: frame.height/2)
        imageView = UIImageView(frame: childFrame)
        imageView.contentMode = .scaleAspectFit
        
        // name label
        childFrame.origin.y += childFrame.height + padding
        childFrame.size.height = 30
        nameLabel = UILabel(frame: childFrame)
        nameLabel.textAlignment = .center
        
        // age label
        childFrame.origin.y += childFrame.height
        ageLabel = UILabel(frame: childFrame)
        ageLabel.textAlignment = .center
        
        // fee label
        childFrame.origin.y += childFrame.height
        adoptionFeeLabel = UILabel(frame: childFrame)
        adoptionFeeLabel.textAlignment = .center
        
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.addSubview(imageView)
        self.addSubview(nameLabel)
        self.addSubview(ageLabel)
        self.addSubview(adoptionFeeLabel)
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }
}

// MARK:- Example (Action!)
let birthday = Date(timeIntervalSinceNow: -2 * 86400 * 366)
let image = UIImage(named: "stuart")!

//model
let stuart = Pet(name: "Struart", birthday: birthday, rarity: .veryRare, image: image)
// view model
let viewModel = PetViewModel(pet: stuart)
//view
let frame = CGRect(x: 0, y: 0, width: 300, height: 420)
let view = PetView(frame: frame)

// Configure
viewModel.configure(view)

// Displaying
PlaygroundPage.current.liveView = view

