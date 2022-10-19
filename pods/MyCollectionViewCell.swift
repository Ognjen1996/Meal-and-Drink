//
//  MyCollectionViewCell.swift
//  pods
//
//  Created by Uros Andonov on 12.10.22..
//

import UIKit
import Kingfisher

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!
//    @IBOutlet var button: UIButton!
    
    static let cellIdentifier = "MyCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        label.textColor = .black
    }
    public func configure(with drink: DrinkModel) {
//        imageView.image = image
        label.text = drink.strDrink
        
        let link = drink.strDrinkThumb
        guard let link = link else { return }
        
        let url = URL(string: link)
        imageView.kf.setImage(with: url)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
}
