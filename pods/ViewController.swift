//
//  ViewController.swift
//  pods
//
//  Created by Uros Andonov on 10.10.22..
//

import UIKit
import Alamofire
import SwiftyJSON


class ViewController: UIViewController {
//    weak var delegate: ViewControlerDelegate?

    @IBOutlet var drinksButton: UIButton!
    @IBOutlet var mealsButton: UIButton!
    var drinks: [DrinkModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        // Do any additional setup after loading the view.
    }
    
    func fetchData() {
        let baseURL = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita"
        guard let url = URL(string: baseURL) else {return}
        let request = URLRequest(url: url)
        AF.request(request).responseJSON { data in
            switch data.result {
            case .success(let dataJson):
                let json = JSON(dataJson)
                
                let drinksArray = json["drinks"].arrayValue
                
                drinksArray.forEach { drink in
                    let parsedDrink = DrinkModel(json: drink)
                    self.drinks.append(parsedDrink)
                }
                
                
            case .failure(let error):
                break
            }
        }
    }
    
    @IBAction func drinksMenu() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "CollectionViewDrinks") as? UIViewController else { return }
        show(vc, sender: self)
        
    }
    @IBAction func mealsMenu() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "CollectionViewMeals") as? UIViewController else { return }
        show(vc, sender: self)
        
    }
    
}




