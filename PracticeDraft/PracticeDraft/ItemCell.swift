//
//  ItemCell.swift
//  PracticeDraft
//
//  Created by Иван Романов on 17/07/2019.
//  Copyright © 2019 Иван Романов. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet var backView: UIView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriprionLabel: UILabel!
    @IBOutlet var iconView: UIImageView!
    
    @IBOutlet var participantStackView: UIStackView!
    @IBOutlet var avatarView: UIImageView!
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
