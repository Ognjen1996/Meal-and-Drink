//
//  MealDetailsViewController.swift
//  pods
//
//  Created by Ognjen on 20.10.22..
//

import UIKit
import WebKit

class MealDetailsViewController: UIViewController, WKUIDelegate {

    @IBOutlet var intstructionLabel: UILabel!
    @IBOutlet var webkit: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        details()

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

    

}
