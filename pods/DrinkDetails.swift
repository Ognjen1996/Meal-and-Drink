//
//  DrinkDetails.swift
//  pods
//
//  Created by Ognjen on 19.10.22..
//

import UIKit
import Kingfisher

class DrinkDetails: UIViewController  {
    
    @IBOutlet var image: UIImageView!
    
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var instructionsLabel: UILabel!
    @IBOutlet var glassLabel: UILabel!
    @IBOutlet var ingredientLabel: UILabel!
    @IBOutlet var measureLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        details()
        
    }
    
    var DRINK: DrinkModel?
    
}

extension DrinkDetails {
    func details() {
        guard let drink = DRINK else { return }
        var ime = drink.strDrink
            
        let link = drink.strDrinkThumb
        let cat = drink.strCategory
        let inst = drink.strInstructions
        guard
            let link = link,
            let cat = cat,
            let inst = inst
        else { return }
        let url = URL(string: link)
        image.kf.setImage(with: url)
        
        categoryLabel.text = "Category: \n" + cat + "\n"
        instructionsLabel.text = "Instructions: \n" + inst + "\n"
        
        
    }
}
