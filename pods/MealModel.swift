//
//  MealModel.swift
//  pods
//
//  Created by Ognjen on 19.10.22..
//

import Foundation
import SwiftyJSON

struct MealModel {
    
    var idMeal: String?
    var strMeal: String?
    var strDrinkAlternate: String?
    var strCategory: String?
    var strArea: String?
    var strInstructions: String?
    var strMealThumb: String?
    var strTags: String?
    var strYoutube: String?
    var strIngredient1: String?
    var strIngredient2: String?
    var strIngredient3: String?
    var strIngredient4: String?
    var strIngredient5: String?
    var strIngredient6: String?
    var strIngredient7: String?
    var strIngredient8: String?
    var strIngredient10: String?
    var strIngredient11: String?
    var strIngredient12: String?
    var strIngredient13: String?
    var strIngredient14: String?
    var strIngredient15: String?
    var strIngredient16: String?
    var strIngredient17: String?
    var strIngredient18: String?
    var strIngredient19: String?
    var strIngredient20: String?
    var strMeasure1: String?
    var strMeasure2: String?
    var strMeasure3: String?
    var strMeasure4: String?
    var strMeasure5: String?
    var strMeasure6: String?
    var strMeasure7: String?
    var strMeasure8: String?
    var strMeasure9: String?
    var strMeasure10: String?
    var strMeasure11: String?
    var strMeasure12: String?
    var strMeasure13: String?
    var strMeasure14: String?
    var strMeasure15: String?
    var strMeasure16: String?
    var strMeasure17: String?
    var strMeasure18: String?
    var strMeasure19: String?
    var strMeasure20: String?
    var strSource: String?
    var strImageSource: String?
    var strCreativeCommonsConfirmed: String?
    var dateModified: String?
    
    init(json: JSON) {
        self.idMeal = json["idMeal"].stringValue
        self.strMeal = json["strMeal"].stringValue
        self.strDrinkAlternate = json["strDrinkAlternate"].stringValue
        self.strCategory = json["strCategory"].stringValue
        self.strArea = json["strArea"].stringValue
        self.strInstructions = json["strInstructions"].stringValue
        self.strMealThumb = json["strMealThumb"].stringValue
        self.strTags = json["strTags"].stringValue
        self.strYoutube = json["strYoutube"].stringValue
        self.strIngredient1 = json["strIngredient1"].stringValue
        self.strIngredient2 = json["strIngredient2"].stringValue
        self.strIngredient3 = json["strIngredient3"].stringValue
        self.strIngredient4 = json["strIngredient4"].stringValue
        self.strIngredient5 = json["strIngredient5"].stringValue
        self.strIngredient6 = json["strIngredient6"].stringValue
        self.strIngredient7 = json["strIngredient7"].stringValue
        self.strIngredient8 = json["strIngredient8"].stringValue
        self.strIngredient10 = json["strIngredient10"].stringValue
        self.strIngredient11 = json["strIngredient11"].stringValue
        self.strIngredient12 = json["strIngredient12"].stringValue
        self.strIngredient13 = json["strIngredient13"].stringValue
        self.strIngredient14 = json["strIngredient14"].stringValue
        self.strIngredient15 = json["strIngredient15"].stringValue
        self.strIngredient16 = json["strIngredient16"].stringValue
        self.strIngredient17 = json["strIngredient17"].stringValue
        self.strIngredient18 = json["strIngredient18"].stringValue
        self.strIngredient19 = json["strIngredient19"].stringValue
        self.strIngredient20 = json["strIngredient20"].stringValue
        self.strMeasure1 = json["strMeasure1"].stringValue
        self.strMeasure2 = json["strMeasure2"].stringValue
        self.strMeasure3 = json["strMeasure3"].stringValue
        self.strMeasure4 = json["strMeasure4"].stringValue
        self.strMeasure5 = json["strMeasure5"].stringValue
        self.strMeasure6 = json["strMeasure6"].stringValue
        self.strMeasure7 = json["strMeasure7"].stringValue
        self.strMeasure8 = json["strMeasure8"].stringValue
        self.strMeasure9 = json["strMeasure9"].stringValue
        self.strMeasure10 = json["strMeasure10"].stringValue
        self.strMeasure11 = json["strMeasure11"].stringValue
        self.strMeasure12 = json["strMeasure12"].stringValue
        self.strMeasure13 = json["strMeasure13"].stringValue
        self.strMeasure14 = json["strMeasure14"].stringValue
        self.strMeasure15 = json["strMeasure15"].stringValue
        self.strMeasure16 = json["strMeasure16"].stringValue
        self.strMeasure17 = json["strMeasure17"].stringValue
        self.strMeasure18 = json["strMeasure18"].stringValue
        self.strMeasure19 = json["strMeasure19"].stringValue
        self.strMeasure20 = json["strMeasure20"].stringValue
        self.strSource = json["strSource"].stringValue
        self.strImageSource = json["strImageSource"].stringValue
        self.strCreativeCommonsConfirmed = json["strCreativeCommonsConfirmed"].stringValue
        self.dateModified = json["dateModified"].stringValue
    }
}



