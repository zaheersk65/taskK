//
//  DetailCell.swift
//  task3
//
//  Created by IMAC on 7/23/19.
//  Copyright © 2019 IMAC. All rights reserved.
//

import UIKit




class DetailCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageHeart: UIImageView!
    
    @IBOutlet weak var gramLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var oldPriceLabel: UILabel!
    
    @IBOutlet weak var newPriceLabel: UILabel!
    
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var imgBtn2: UIButton!
    @IBOutlet weak var imagBtn1: UIButton!
    @IBOutlet weak var labelValue: UILabel!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var plus: UIButton!
    
    @IBOutlet weak var stack: UIStackView!
    
    var value = 1
    
    //var value1 = 0
    
    
   
       // plus.backgroundColor = (!plus.isSelected) ? .black : .red // This is used to two colors by clicking one by one
 
    
    @IBAction func plusBtn(_ sender: UIButton) {
        
        value += 1
        labelValue.text = String(value)
        
        
//        value1 = Int(newPriceLabel.text!)!
//        self.newPriceLabel.text = String(value1 + value1); //This is to display a label
        
        
    }
    //This is for increasing and decreasing the value with two buttons
    @IBAction func minusBtn(_ sender: UIButton) {
        
        if value > 1 {
            value -= 1
            labelValue.text = String(value)
        }
        else if value == 1 {
            plusBtn.isHidden = false
            stack.isHidden = true
        }
        
    }
   
    @IBAction func plusStack(_ sender: UIButton) {
        stack.isHidden = false
        plusBtn.isHidden = true
    }
    
    @IBAction func imageBnt1(_ sender: UIButton) {
        
        
        
        imagBtn1.isHidden = true
        imgBtn2.isHidden = false
    }
    
    @IBAction func imageBtn2(_ sender: UIButton) {
        imgBtn2.isHidden = true
        imagBtn1.isHidden = false
    }
    
    
}
