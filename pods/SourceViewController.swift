//
//  SourceViewController.swift
//  pods
//
//  Created by Ognjen on 21.10.22..
//

import UIKit
import WebKit

class SourceViewController: UIViewController {
    
    @IBOutlet var webkit: WKWebView!
    var button: UIButton!
    var MEAL: MealModel?
    var sourceProtocol: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Source"
        source()

        // Do any additional setup after loading the view.
    }
    

    func source() {
//        guard let meal = MEAL else {return}
        let url = sourceProtocol
        guard let url = url else {return}
        let myURL = URL(string: url)
        guard
            let myURL = myURL
        else {return}

        let request = URLRequest (url: myURL)
        webkit.load(request)
    }

}
