//
//  MyCollectionViewCell.swift
//  pods
//
//  Created by Uros Andonov on 12.10.22..
//

import UIKit

protocol MealCollectionViewCellDelegate: AnyObject {
    func mealCollectionViewCell(_ cell: MealCollectionViewCell, didTapOnSourceButtonWithSourceData source: String)
}

class MealCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView1: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var areaLabel: UILabel!
    @IBOutlet var sourceLabel: UILabel!
    @IBOutlet var btnCounter: UIButton!

    var mealData: MealModel!
    
    weak var delegate: MealCollectionViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        btnCounter.addTarget(
            self, action: #selector(sourceButtonHandler), for: .touchUpInside)
    }
    
    public func configure(with meal: MealModel) {
        self.mealData = meal
        sourceLabel.attributedText = NSAttributedString(string: "Source", attributes:
                                                                [.underlineStyle: NSUnderlineStyle.single.rawValue])
        let name = meal.strMeal
        let area = meal.strArea
        let link = meal.strMealThumb
        guard
            let name = name,
            let area = area,
            let link = link
        else {return}
        nameLabel.text = "Name: " + name
        areaLabel.text = "Area: " + area
        let url = URL(string: link)
        imageView1.kf.setImage(with: url)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "MealCollectionViewCell", bundle: nil)
    }


    @objc private func sourceButtonHandler() {
        let sourceData = self.mealData.strSource ?? ""
        self.delegate?.mealCollectionViewCell(
            self, didTapOnSourceButtonWithSourceData: sourceData)
    }
}
