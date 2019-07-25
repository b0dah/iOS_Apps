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
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    lazy var pictureView : UIImageView = { // can't give the name "image"
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        // maintaining aspect ratio
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var headlineLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 120, y: 50, width: backView.frame.width - 120, height: 30))
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    override func layoutSubviews() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        backView.layer.cornerRadius = 8
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let margins = self.layoutMarginsGuide
        
        // MARK: - BackView constraints
        addSubview(backView)
        backView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        backView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        backView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.95).isActive = true
        backView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.9).isActive = true
        
        // MARK: - Headline constraints
        backView.addSubview(headlineLabel)
        headlineLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 10).isActive = true
        headlineLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -10).isActive = true
        headlineLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 20).isActive = true
        //headlineLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -20).isActive = true
        
        // MARK: - Description constraints
        backView.addSubview(descriptionLabel)
        descriptionLabel.leadingAnchor.constraint(equalTo: headlineLabel.leadingAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: headlineLabel.trailingAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: headlineLabel.bottomAnchor, constant: 20).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -20).isActive = true
        
        //backView.addSubview(pictureView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK - required methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        
    }

}
