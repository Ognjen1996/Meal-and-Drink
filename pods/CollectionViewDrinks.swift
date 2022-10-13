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
    //    @IBOutlet var randomDrink: UIButton!
        @IBOutlet var textField: UITextField!
        var drinks: [DrinkModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 120)
        colletionView.collectionViewLayout = layout
        
        colletionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: "MyCollectionViewCell")
        colletionView.delegate = self
        colletionView.dataSource = self
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func randomDrink() {
        //random number generator ide u switch i na osnovu toga prikazuje se odredjeno pice
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

}



extension CollectionViewDrinks: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
extension CollectionViewDrinks: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell

       
        cell.configure(with: UIImage(named: "cocktail1")!)
        cell.label.text = "Mojito"
        
        
        return cell
    }
}
extension CollectionViewDrinks: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/2.2, height: 300)
    }
}
