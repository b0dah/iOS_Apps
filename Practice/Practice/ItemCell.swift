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
    
    @IBOutlet var mainStackView: UIStackView!
    
    @IBOutlet var topStackView: UIStackView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var iconView: UIImageView!
    
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
    
    // MARK: - item instance for the cell
    var item : Item? {
        didSet {
            self.updateUI()
        }
    }
    
    func setData(currentItem: Item) {
        self.item = currentItem
    }
    
    // MARK: - updating UI with current received instance's data
    private func updateUI() {
        
        // MARK: - Top Mandatory View Setting Label
        
        // time
        let beginTime = item!.beginDate.suffix(8)
        let endTime = item!.endDate.suffix(8)
        self.timeLabel.text = beginTime.prefix(5) + "-" + endTime.prefix(5)
    
        //location
        self.venueLabel.text = item?.venue
    
        // Name
        self.titleLabel.text = item?.name
        
        // MARK: - Design for cell where (kind 2)
        
        guard item?.kind != 2 else { // set only the icon, hide the extra areas and return
            
            if let imageId = item?.imageId {
                self.iconView.image = UIImage(named: String(imageId) )
                self.iconView.isHidden = false /**/
            }
            else {
                self.iconView.isHidden = true
            }
            
            // hide description area
            self.mainStackView.arrangedSubviews[1].isHidden = true
            // hide the participant area
            self.mainStackView.arrangedSubviews.last?.isHidden = true
            
            return
        }
        
        // MARK: - Setting Labels for cells (kind = 1)
        
        self.iconView.isHidden = true
      
        self.descriptionLabel.text = item?.description //self.descriptionLabel.isHidden = false /**/
        // unhide the description area
        self.mainStackView.arrangedSubviews[1].isHidden = false
    
        
        // participant section
        if item?.participant[0].name == nil {  // if no participant
            // hide the participant area
            mainStackView.arrangedSubviews.last?.isHidden = true //self.participantStackView.isHidden = true
        }
        else {
    
            if let imageId = item?.participant[0].imageId { // avatar
                self.avatarView.image = UIImage(named: String(imageId) )
            }
            else {
                self.avatarView.isHidden = true
            }
    
            self.participantNameLabel.text = item!.participant[0].surname! + " " + item!.participant[0].name!.prefix(1) + ". " + item!.participant[0].patronyc!.prefix(1) + "."
            self.participantPositionLabel.text = item?.participant[0].position
            self.participantCompanyLabel.text = item?.participant[0].company
            
            // unhide the participant area
            mainStackView.arrangedSubviews.last?.isHidden = false //self.participantStackView.isHidden = false /**/
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        backView.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 29/255, alpha: 0.5)
        backView.layer.cornerRadius = 7
        
        iconView.layer.cornerRadius = 8
        avatarView.layer.cornerRadius = 17
    }

}
