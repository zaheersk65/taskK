//
//  segment.swift
//  task3
//
//  Created by IMAC on 8/5/19.
//  Copyright © 2019 IMAC. All rights reserved.
//

import UIKit

class segment: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
   
    
    @IBOutlet weak var collectionView2: UICollectionView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
   
    
    let array = ["Asia","Africa","Europe"]
    let countriesArray = [["China", "Japan", "Korea"],
                          ["Egypt", "Sudan", "South Africa"],
                          ["Spain", "Netherlands", "France"]]//This is array Dictionary
    //This is used to change this above dictionary into array
    var selectedArray = [String]()
    //This is used for index value for dictionary to array
    var selectedIndex = 0
    var selectedIndexPath = IndexPath(item: 0, section: 0)
    
    var indicatorView = UIView()
    let indicatorHeight : CGFloat = 3
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //This is used to save dictionay data into string array
         selectedArray = countriesArray[selectedIndex]
        //menuCollection.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .centeredVertically)
        
        //This is use to swipe the screen to navigate next tableView with collectionView Indicator
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction))
        leftSwipe.direction = .left
        self.view.addGestureRecognizer(leftSwipe)
        //This is use to swipe the screen to navigate next tableView with collectionView Indicator
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction))
        rightSwipe.direction = .right
        self.view.addGestureRecognizer(rightSwipe)
    
        //sliding move with animating
        //This is used to show animate and symbol on the item sliding
        indicatorView.backgroundColor = .white
        indicatorView.frame = CGRect(x: collectionView.bounds.minX, y: collectionView.bounds.maxY - indicatorHeight, width: collectionView.bounds.width / CGFloat(array.count), height: indicatorHeight)
        collectionView.addSubview(indicatorView)
        
        
    }
    //This is used to swipe left and right
    @objc func swipeAction(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .left {
            if selectedIndex < array.count - 1 {
                selectedIndex += 1
            }
        } else {
            if selectedIndex > 0 {
                selectedIndex -= 1
            }
        }
        
        selectedIndexPath = IndexPath(item: selectedIndex, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: true, scrollPosition: .centeredVertically)
         refreshContent()
        
    }
    func refreshContent(){
        selectedArray = countriesArray[selectedIndex]
        collectionView2.reloadData()
        
        let desiredX = (collectionView.bounds.width / CGFloat(array.count)) * CGFloat(selectedIndex)
        
        UIView.animate(withDuration: 0.3) {
            self.indicatorView.frame = CGRect(x: desiredX, y: self.collectionView.bounds.maxY - self.indicatorHeight, width: self.collectionView.bounds.width / CGFloat(self.array.count), height: self.indicatorHeight)
        }
    }

    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView {
            return array.count
        }else {
            return selectedArray.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView {
            let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier:"SegmentCollection", for: indexPath) as! SegmentCollection
            cell.collectionLabel.text = array[indexPath.row]
            return cell
        }else{
           
            let cell1 = self.collectionView2.dequeueReusableCell(withReuseIdentifier:"SegmentTableCell", for: indexPath) as! SegmentTableCell
            cell1.collectionDetailsCell.text = selectedArray[indexPath.row]
            return cell1
        }
        
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: self.view.frame.width / CGFloat(array.count), height: collectionView.bounds.height)
//    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == self.collectionView {
            //This is used to change the content as per index of table view
            selectedIndex = indexPath.item
            //It will take to other tableView data
            refreshContent()
        }else {
            collectionView2.deselectItem(at: indexPath, animated: true)
            
            
        }
        
    }
     
      
       

  
}

