//
//  CollectionViewDrinks.swift
//  pods
//
//  Created by Uros Andonov on 12.10.22..
//

import UIKit
import Alamofire
import SwiftyJSON

final class CollectionViewMeals: UIViewController {
    
    @IBOutlet var colletionView1: UICollectionView!
    @IBOutlet var textField: UITextField!
//    @IBOutlet var btnCounter: UIButton!
    @IBOutlet var areaButton: UIButton!
    var selectedArea: String?
    
    var meals:[MealModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.colletionView1.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 120)
        colletionView1.collectionViewLayout = layout
        
        colletionView1.register(pods.MealCollectionViewCell.nib(), forCellWithReuseIdentifier: "MealCollectionViewCell")
        colletionView1.delegate = self
        colletionView1.dataSource = self
        

        fetchDataMeal()
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        let searchText = textField.text ?? ""
        fetchDataMeal(usingText: searchText)
    }
    
    func fetchDataMeal(usingText: String = "") {
        self.meals.removeAll()
        let baseURL = "https://www.themealdb.com/api/json/v1/1/search.php?s=\(usingText)"
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
    
@IBAction func radnomMeal()  {
        let next = self.storyboard?.instantiateViewController(withIdentifier: "MealDetailsViewController") as! MealDetailsViewController
        next.isRandom = true
        show(next, sender: self)

    }
    
    @IBAction func mealByArea() {
        let next = self.storyboard?.instantiateViewController(withIdentifier: "SearchByAreaViewController") as! SearchByAreaViewController
        show(next, sender: self)
        
    }
}


extension CollectionViewMeals: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let MEAL = self.meals[indexPath.row]
        
        let next = self.storyboard?.instantiateViewController(withIdentifier: "MealDetailsViewController") as! MealDetailsViewController
        next.MEAL = MEAL
        
        show(next, sender: self)
        
    }
}
extension CollectionViewMeals: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.meals.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MealCollectionViewCell", for: indexPath) as! MealCollectionViewCell
        cell.delegate = self
        let meals = self.meals[indexPath.row]
        cell.configure(with: meals)
        
        return cell
    }
}
extension CollectionViewMeals: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewFrame = collectionView.frame
        return CGSize(width: collectionViewFrame.size.width/1, height: collectionViewFrame.height / 1.8 )
    }
}

extension CollectionViewMeals: MealCollectionViewCellDelegate {
    func MealCollectionViewCell(cell: MealCollectionViewCell, source: String) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SourceViewController") as! SourceViewController
        vc.sourceProtocol = source
        show(vc, sender: self)
    }
}
 
