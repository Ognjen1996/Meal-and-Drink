//
//  MealDetailsViewController.swift
//  pods
//
//  Created by Ognjen on 20.10.22..
//

import UIKit
import WebKit
import Alamofire
import SwiftyJSON

class MealDetailsViewController: UIViewController, WKUIDelegate {

    @IBOutlet var intstructionLabel: UILabel!
    @IBOutlet var webkit: WKWebView!
    var isRandom: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if isRandom {
            fetchRandomMeal()
        }
        else {
            details()
        }

    }
    var MEAL: MealModel?
    
    
    func details() {
        guard let meal = MEAL else { return }
        let inst = meal.strInstructions
        guard let inst = inst else { return }
        intstructionLabel.text = "\n" + inst
        
        let url = meal.strYoutube
        guard let url = url else {return}
        let myURL = URL(string: url)
        guard
            let myURL = myURL
        else {return}
        
        let request = URLRequest (url: myURL)
        webkit.load(request)
        
    }
    
    private func fetchRandomMeal() {
        isRandom = false
        let baseURL = "https://www.themealdb.com/api/json/v1/1/random.php"
        guard let url = URL(string: baseURL) else {return}
        let request = URLRequest(url: url)
        AF.request(request).responseJSON { data in
            switch data.result {
            case .success(let dataJson):
                let json = JSON(dataJson)
                
                let mealsArray = json["meals"].arrayValue
                
                mealsArray.forEach { meal in
                    let parsedMeal = MealModel(json: meal)
                    self.MEAL = parsedMeal
                }
                self.details()
                
            case .failure(let error):
                break
            }
        }
    }

}
