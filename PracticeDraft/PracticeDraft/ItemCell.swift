//
//  ItemCell.swift
//  PracticeDraft
//
//  Created by Иван Романов on 17/07/2019.
//  Copyright © 2019 Иван Романов. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriprionLabel: UILabel!
    @IBOutlet var avatarView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
