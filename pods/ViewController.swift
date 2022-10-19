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




