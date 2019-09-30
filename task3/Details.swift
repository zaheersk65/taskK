//
//  Details.swift
//  task3
//
//  Created by IMAC on 7/16/19.
//  Copyright © 2019 IMAC. All rights reserved.
//

import UIKit

class Details: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    var title1 = global.title//This is used to get data from other view controller with global variable
    var img = [UIImage(named: "ice"),UIImage(named: "mobile"),UIImage(named: "mobile"),UIImage(named: "ice"),UIImage(named: "ice"),UIImage(named: "mobile"),UIImage(named: "mobile")]
    var price = ["75.00 INR","99.00 INR","65.00 INR","49.00 INR","999.00 INR","149.00 INR","500.00 INR"]
   // var cart = cart()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return title1.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = self.collctionView.dequeueReusableCell(withReuseIdentifier: "DetailCell", for: indexPath) as! DetailCell
        cell.descriptionLabel.text = title1[indexPath.row]
        cell.imageView.image = img[indexPath.row]
        cell.imgBtn2.isHidden = true
        cell.stack.isHidden = true
        cell.newPriceLabel.text = price[indexPath.row]
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.tabBarController!.tabBar.isHidden = true//This is used for hidding tab bar controller
        //
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Details1") as! Details1
        vc.imageto = img[indexPath.row] as? UIImage
        vc.label = title1[indexPath.row]
        vc.priceLabel = price[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }

    
    @IBOutlet weak var collctionView: UICollectionView!
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //collctionView.isHidden = true

       
    }
    

   
}
