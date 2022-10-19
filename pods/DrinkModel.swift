//
//  DrinkModel.swift
//  pods
//
//  Created by Uros Andonov on 11.10.22..
//

import Foundation
import SwiftyJSON

struct DrinkModel {

    var strIngredient2: String?
    var dateModified: String?
    var strIngredient14: String?
    var strIngredient6: String?
    var strMeasure1: String?
    var strMeasure9: String?
    var strImageAttribution: String?
    var strCategory: String?
    var strGlass: String?
    var strAlcoholic: String?
    var idDrink: String?
    var strMeasure5: String?
    var strMeasure8: String?
    var strIngredient8: String?
    var strIngredient5: String?
    var strIngredient10: String?
    var strInstructionsZHHANS: String?
    var strMeasure7: String?
    var strIngredient11: String?
    var strInstructionsDE: String?
    var strMeasure2: String?
    var strMeasure6: String?
    var strIngredient1: String?
    var strDrinkThumb: String?
    var strMeasure14: String?
    var strMeasure11: String?
    var strDrinkAlternate: String?
    var strMeasure4: String?
    var strIngredient3: String?
    var strIngredient4: String?
    var strMeasure13: String?
    var strInstructionsFR: String?
    var strMeasure10: String?
    var strIngredient15: String?
    var strMeasure15: String?
    var strIngredient12: String?
    var strInstructionsES: String?
    var strIBA: String?
    var strTags: String?
    var strInstructions: String?
    var strIngredient13: String?
    var strDrink: String?
    var strMeasure12: String?
    var strImageSource: String?
    var strInstructionsIT: String?
    var strIngredient9: String?
    var strVideo: String?
    var strCreativeCommonsConfirmed: String?
    var strInstructionsZH: String?
    var strMeasure3: String?
    var strIngredient7: String?
    
    init(json: JSON) {
        self.strIngredient2 = json["strIngredient2"].stringValue
        self.dateModified = json["dateModified"].stringValue
        self.strIngredient14 = json["strIngredient14"].stringValue
        self.strIngredient6 = json["strIngredient6"].stringValue
        self.strMeasure1 = json["strMeasure1"].stringValue
        self.strMeasure9 = json["strMeasure9"].stringValue
        self.strImageAttribution = json["strImageAttribution"].stringValue
        self.strCategory = json["strCategory"].stringValue
        self.strGlass = json["strGlass"].stringValue
        self.strAlcoholic = json["strAlcoholic"].stringValue
        self.idDrink = json["idDrink"].stringValue
        self.strMeasure5 = json["strMeasure5"].stringValue
        self.strMeasure8 = json["strMeasure8"].stringValue
        self.strIngredient8 = json["strIngredient8"].stringValue
        self.strImageSource = json["strImageSource"].stringValue
        self.strIngredient5 = json["strIngredient5"].stringValue
        self.strIngredient10 = json["strIngredient10"].stringValue
        self.strInstructionsZHHANS = json["strInstructionsZH-HANS"].stringValue
        self.strMeasure7 = json["strMeasure7"].stringValue
        self.strIngredient11 = json["strIngredient11"].stringValue
        self.strInstructionsDE = json["strInstructionsDE"].stringValue
        self.strMeasure2 = json["strMeasure2"].stringValue
        self.strMeasure6 = json["strMeasure6"].stringValue
        self.strIngredient1 = json["strIngredient1"].stringValue
        self.strDrinkThumb = json["strDrinkThumb"].stringValue
        self.strMeasure14 = json["strMeasure14"].stringValue
        self.strMeasure11 = json["strMeasure11"].stringValue
        self.strDrinkAlternate = json["strDrinkAlternate"].stringValue
        self.strMeasure4 = json["strMeasure4"].stringValue
        self.strIngredient3 = json["strIngredient3"].stringValue
        self.strIngredient4 = json["strIngredient4"].stringValue
        self.strMeasure13 = json["strMeasure13"].stringValue
        self.strInstructionsFR = json["strInstructionsFR"].stringValue
        self.strMeasure10 = json["strMeasure10"].stringValue
        self.strIngredient15 = json["strIngredient15"].stringValue
        self.strMeasure15 = json["strMeasure15"].stringValue
        self.strIngredient12 = json["strIngredient12"].stringValue
        self.strInstructionsES = json["strInstructionsES"].stringValue
        self.strIBA = json["strIBA"].stringValue
        self.strTags = json["strTags"].stringValue
        self.strInstructions = json["strInstructions"].stringValue
        self.strIngredient9 = json["strIngredient9"].stringValue
        self.strVideo = json["strVideo"].stringValue
        self.strCreativeCommonsConfirmed = json["strCreativeCommonsConfirmed"].stringValue
        self.strInstructionsZH = json["strInstructionsZH"].stringValue
        self.strMeasure3 = json["strMeasure3"].stringValue
        self.strIngredient7 = json["strIngredient7"].stringValue
        self.strDrink = json["strDrink"].stringValue
    }
}
