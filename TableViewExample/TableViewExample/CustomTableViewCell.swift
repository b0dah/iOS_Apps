//
//  CustomTableViewCell.swift
//  TableViewExample
//
//  Created by Иван Романов on 20.04.2020.
//  Copyright © 2020 Иван Романов. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var pictureView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(with museum: Museum) {
        pictureView.image = UIImage(named: museum.imageName)
        pictureView.makeRounded()
        backView.layer.cornerRadius = pictureView.frame.width/8
        
        nameLabel.text = museum.name
        cityLabel.text = museum.city
    }
    
}
