//
//  MyCollectionViewCell.swift
//  pods
//
//  Created by Uros Andonov on 12.10.22..
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!

    override func awakeFromNib() {
        

        super.awakeFromNib()
        
    }
    public func configure(with image: UIImage){
        imageView.image = image
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }

}
