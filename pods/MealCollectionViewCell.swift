//
//  MyCollectionViewCell.swift
//  pods
//
//  Created by Uros Andonov on 12.10.22..
//

import UIKit

class MealCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView1: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var areaLabel: UILabel!
    @IBOutlet var sourceLabel: UILabel!

    override func awakeFromNib() {
        

        super.awakeFromNib()
        
    }
    public func configure(with image: UIImage){
        imageView1.image = image
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "MealCollectionViewCell", bundle: nil)
    }

}
