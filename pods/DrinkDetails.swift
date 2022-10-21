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
    var MEAL: MealModel?
    
}

extension DrinkDetails {
    func details() {
        guard let drink = DRINK else { return }
        let ingredients = (drink.strIngredient1 ?? "") + "\n" + (drink.strIngredient2 ?? "") + "\n" + (drink.strIngredient3 ?? "") + "\n" + (drink.strIngredient4 ?? "") + "\n" + (drink.strIngredient5 ?? "") + "\n" + (drink.strIngredient6 ?? "") + "\n" + (drink.strIngredient7 ?? "") + "\n" + (drink.strIngredient8 ?? "") + "\n"
        
        let ingredients1 = (drink.strIngredient9 ?? "") + "\n" + (drink.strIngredient10 ?? "") + "\n" + (drink.strIngredient11 ?? "") + "\n" + (drink.strIngredient12 ?? "") + "\n"
        
        let ingredients2 = (drink.strIngredient13 ?? "") + "\n" + (drink.strIngredient14 ?? "") + "\n" + (drink.strIngredient15 ?? "") + "\n"

        
      
        let glass = drink.strGlass
        let link = drink.strDrinkThumb
        let cat = drink.strCategory
        let inst = drink.strInstructions
        guard
            let link = link,
            let cat = cat,
            let inst = inst,
            let glass = glass
        else { return }
        title = drink.strDrink
        let url = URL(string: link)
        image.kf.setImage(with: url)
        
        categoryLabel.text = "Category: \n" + cat + "\n"
        instructionsLabel.text = "Instructions: \n" + inst + "\n"
        glassLabel.text = "Glass: \n" + glass + "\n"
        ingredientLabel.text = "Ingredients: \n" + ingredients + ingredients1 + ingredients2
        
    }
}
