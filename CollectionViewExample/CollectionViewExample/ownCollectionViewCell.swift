//
//  OwnCollectionViewCell.swift
//  CollectionViewExample
//
//  Created by Иван Романов on 07.08.2020.
//  Copyright © 2020 Иван Романов. All rights reserved.
//

import UIKit

class OwnCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "OwnCollectionViewCell"
    
    @IBOutlet var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(with image: UIImage) {
        imageView.image = image
    }
    
    static func nib() -> UINib {
        return UINib.init(nibName: "OwnCollectionViewCell", bundle: nil)
    }

}
