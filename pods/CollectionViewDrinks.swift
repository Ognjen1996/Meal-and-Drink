//
//  CollectionViewDrinks.swift
//  pods
//
//  Created by Uros Andonov on 12.10.22..
//

import UIKit
import Alamofire
import SwiftyJSON

final class CollectionViewDrinks: UIViewController {
    
        @IBOutlet var colletionView: UICollectionView!
        @IBOutlet var randomDrinkButton: UIButton!
        @IBOutlet var textField: UITextField!
    
    var filterString: String?
        @IBOutlet var button: UIButton!
    
    var drinks: [DrinkModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.colletionView.reloadData()
            }
        }
    }
    private var filteredDrinks: [DrinkModel] {
        guard let filter = filterString else {
            return drinks
        }
        var arr: [DrinkModel] = []
        for cc in drinks {
            guard let mm = cc.strDrink else {return drinks}
            if mm.contains(filter){
                arr.append(cc)
            }
            
        }
        return arr
        

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 120)
        colletionView.collectionViewLayout = layout
        
        colletionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.cellIdentifier)
        colletionView.delegate = self
        colletionView.dataSource = self
        
        fetchData()
        // Do any additional setup after loading the view.
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        let searchText = textField.text ?? ""
        fetchData(usingText: searchText)
    }
    
    func fetchData(usingText: String = "") {
        self.drinks.removeAll()
        let baseURL = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=\(usingText)"
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
    
    
    
    @IBAction func drinkDetails() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? UIViewController else { return }
        show(vc, sender: self)
//        navigationController?.pushViewController(vc, animated: true)
}

}

extension CollectionViewDrinks: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
extension CollectionViewDrinks: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.filteredDrinks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
        
        let drink = self.filteredDrinks[indexPath.row]
        cell.configure(with: drink)
        
        return cell
    }
}
extension CollectionViewDrinks: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/2.2, height: 300)
    }
}
