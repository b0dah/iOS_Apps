//
//  ArticleCell.swift
//  NewsApp
//
//  Created by Иван Романов on 25/07/2019.
//  Copyright © 2019 Иван Романов. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    let backViewSpacing = CGFloat(10)
    let cellContentSpacing = CGFloat(5)
    
    
    lazy var backView: UIView = {
        let view = UIView(frame: CGRect(x: backViewSpacing, y: backViewSpacing, width: self.frame.width - 2 * backViewSpacing, height: self.frame.height - 2 * backViewSpacing))
        view.backgroundColor = .white
        return view
    }()

    lazy var pictureView : UIImageView = { // can't give the name "image"
        let image = UIImageView(frame: CGRect(x: cellContentSpacing, y: cellContentSpacing, width: 100, height: 100))
        
        // maintaining aspect ratio
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var headlineLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 120, y: cellContentSpacing, width: backView.frame.width - 120, height: 30))
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 120, y: 50, width: backView.frame.width - 120, height: 30))
        label.textAlignment = .left
        
        return label
    }()
    
    override func layoutSubviews() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        backView.layer.cornerRadius = 8
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        addSubview(backView)
        
        backView.addSubview(pictureView)
        backView.addSubview(headlineLabel)
        backView.addSubview(descriptionLabel)
        
    }

}
