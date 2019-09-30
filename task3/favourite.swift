//
//  favourite.swift
//  task3
//
//  Created by IMAC on 7/16/19.
//  Copyright © 2019 IMAC. All rights reserved.
//

import UIKit

class favourite: UIViewController ,UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "FavouriteCell", for: indexPath) as! FavouriteCell
        cell.stackView.isHidden = true
        
        return cell
        
    }
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    

}

