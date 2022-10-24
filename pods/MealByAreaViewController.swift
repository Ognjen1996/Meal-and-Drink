//
//  MealByAreaViewController.swift
//  pods
//
//  Created by Ognjen on 24.10.22..
//

import UIKit
import Alamofire
import SwiftyJSON

class MealByAreaViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    var selectedArea: String?
    
    var meals:[MealModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    var mealsByID: MealModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let selectedArea = selectedArea else {
            return
        }
        self.title = selectedArea + " Meal Area"
        fetchDataMeal(usingText: selectedArea)
        
        collectionView.register(pods.MyCollectionViewCell.nib(), forCellWithReuseIdentifier: "MyCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self

    }
    
    func fetchDataMeal(usingText: String = "") {

        let baseURL = "https://www.themealdb.com/api/json/v1/1/filter.php?a=\(usingText)"
        guard let url = URL(string: baseURL) else {return}
        let request = URLRequest(url: url)
        AF.request(request).responseJSON { data in
            switch data.result {
            case .success(let dataJson):
                let json = JSON(dataJson)
                
                let mealsArray = json["meals"].arrayValue
                
                mealsArray.forEach { meal in
                    let parsedMeal = MealModel(json: meal)
                    self.meals.append(parsedMeal)
                }
                
            case .failure(let error):
                break
            }
        }
    }
}
extension MealByAreaViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let MEAL = self.meals[indexPath.row]
        
        let next = self.storyboard?.instantiateViewController(withIdentifier: "MealDetailsViewController") as! MealDetailsViewController
        guard let id = MEAL.idMeal else {return}
        next.id = id

        show(next, sender: self)
    }
}

extension MealByAreaViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.meals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
        
        let cc = self.meals[indexPath.row]
        cell.configureMeal(with: cc)
        return cell
    }
}

extension MealByAreaViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = collectionViewLayout as! GridLayout

        let availableWidth = collectionView.bounds.size.width
        let columns = 2
        var itemTotalWidth = availableWidth - CGFloat(columns) * layout.minimumInteritemSpacing
        itemTotalWidth -= (layout.sectionInset.left + layout.sectionInset.right)

        let itemWidth = itemTotalWidth / CGFloat(columns)
        let itemHeight = itemWidth * 1.5
        return CGSize(width: itemWidth, height: itemHeight)
    }
}
