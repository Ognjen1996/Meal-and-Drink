//
//  SearchByAreaViewController.swift
//  pods
//
//  Created by Ognjen on 21.10.22..
//

import UIKit
import Alamofire
import SwiftyJSON

class SearchByAreaViewController: UIViewController {

   @IBOutlet private weak var tableView: UITableView!
    
    var areas: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func fetchDataMeal(usingText: String = "") {
        let baseURL = "https://www.themealdb.com/api/json/v1/1/list.php?a=\(usingText)"
        guard let url = URL(string: baseURL) else {return}
        let request = URLRequest(url: url)
        AF.request(request).responseJSON { data in
            switch data.result {
            case .success(let dataJson):
                let json = JSON(dataJson)
                
                let mealsArray = json["meals"].arrayValue
                
                mealsArray.forEach { meal in
                    let parsedMeal = MealModel(json: meal)
                    self.areas.append(parsedMeal.strArea ?? "")
                }
                
            case .failure(let error):
                break
            }
        }
    }
    
}

extension SearchByAreaViewController: UITableViewDelegate {
    
}

extension SearchByAreaViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: AreaTableViewCell = tableView.dequeueReusableCell(withIdentifier: "AreaTableViewCell", for: indexPath) as! AreaTableViewCell
        let cc = areas
        cell.populateCell(with: cc)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return areas.count
    }
}
