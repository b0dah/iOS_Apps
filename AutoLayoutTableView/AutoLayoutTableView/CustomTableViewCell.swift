//
//  CustomTableViewCell.swift
//  AutoLayoutTableView
//
//  Created by Иван Романов on 21/07/2019.
//  Copyright © 2019 Иван Романов. All rights reserved.
//

import UIKit
import Foundation

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var imageLabel: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
