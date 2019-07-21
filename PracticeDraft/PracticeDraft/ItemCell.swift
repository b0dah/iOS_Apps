//
//  ItemCell.swift
//  PracticeDraft
//
//  Created by Иван Романов on 17/07/2019.
//  Copyright © 2019 Иван Романов. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    private var starActivated = false
    
    @IBOutlet var backView: UIView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriprionLabel: UILabel!
    @IBOutlet var iconView: UIImageView!
    
    @IBOutlet var participantStackView: UIStackView!
    @IBOutlet var avatarView: UIImageView!
    @IBOutlet var participantNameLabel: UILabel!
    @IBOutlet var participantPositionLabel: UILabel!
    @IBOutlet var participantCompanyLabel: UILabel!
    
    
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var venueLabel: UILabel!
    
    @IBOutlet var starButton: UIButton!
    @IBAction func setStar(_ sender: UIButton) {
        if !starActivated {
            starButton.setImage(UIImage(named: "starActive.png")!, for: .normal)
            starActivated = true
        }
        else {
            starButton.setImage(UIImage(named: "star.png")!, for: .normal)
            starActivated = false
        }
    }
    
    func setData(currentItem: Item) {
        // time
        let beginTime = currentItem.beginDate.suffix(8)
        let endTime = currentItem.endDate.suffix(8)
        self.timeLabel.text = beginTime.prefix(5) + "-" + endTime.prefix(5)
    
        //location
        self.venueLabel.text = currentItem.venue
    
        // Mandatory
        self.nameLabel.text = currentItem.name
        self.descriprionLabel.text = currentItem.description
    
        // icon
        if let imageId = currentItem.imageId {
            self.iconView.image = UIImage(named: String(imageId) )
            self.iconView.isHidden = false /**/
        }
        else {
            self.iconView.isHidden = true
        }
    
        // kind 2
        if currentItem.kind == 2 {
            self.descriprionLabel.isHidden = true
        }
        else {
            self.descriprionLabel.isHidden = false /**/
        }
    
        // participant section
        if currentItem.participant[0].name == nil {  // if no participant
        self.participantStackView.isHidden = true
        }
        else {
            self.participantStackView.isHidden = false /**/
    
            if let imageId = currentItem.participant[0].imageId { // avatar
                self.avatarView.image = UIImage(named: String(imageId) )
            }
            else {
                self.avatarView.isHidden = true
            }
    
            self.participantNameLabel.text = currentItem.participant[0].surname! + " " + currentItem.participant[0].name!.prefix(1) + ". " + currentItem.participant[0].patronyc!.prefix(1) + "."
            self.participantPositionLabel.text = currentItem.participant[0].position
            self.participantCompanyLabel.text = currentItem.participant[0].company
        }
        
    }
    
    /*lazy var backview: UIView = {
        let view = UIView(frame: CGRect(x: 13, y: 8, width: self.frame.width - 26, height: 150))
        view.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 29/255, alpha: 0.5)
        return view
    }()*/
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        backView.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 29/255, alpha: 0.5)
        backView.layer.cornerRadius = 7
        backView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(backView)
        
        iconView.layer.cornerRadius = 8
        avatarView.layer.cornerRadius = 17
    }

}
