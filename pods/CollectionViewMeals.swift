//
//  CollectionViewDrinks.swift
//  pods
//
//  Created by Uros Andonov on 12.10.22..
//

import UIKit

final class CollectionViewMeals: UIViewController {
    
    @IBOutlet var colletionView1: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 120)
        colletionView1.collectionViewLayout = layout
        
        colletionView1.register(MealCollectionViewCell.nib(), forCellWithReuseIdentifier: "MealCollectionViewCell")
        colletionView1.delegate = self
        colletionView1.dataSource = self
        

        // Do any additional setup after loading the view.
    }

}

extension CollectionViewMeals: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
extension CollectionViewMeals: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MealCollectionViewCell", for: indexPath) as! MealCollectionViewCell
        
        cell.configure(with: UIImage(named: "meal")!)
        cell.nameLabel.text = "Name: Corba"
        cell.areaLabel.text = "Area: Turkish"
        cell.sourceLabel.text = "Source"
//        cell.sourceLabel.toggleUnderline(self)
       
        
        return cell
    }
}
extension CollectionViewMeals: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/1, height:250)
    }
}
