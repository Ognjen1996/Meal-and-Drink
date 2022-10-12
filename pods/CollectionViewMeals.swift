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
        
        colletionView1.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: "MyCollectionViewCell")
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
        
        cell.configure(with: UIImage(named: "meal")!)
       
        
        return cell
    }
}
extension CollectionViewMeals: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/1, height: 300)
    }
}
