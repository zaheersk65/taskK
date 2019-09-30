//
//  FavouriteCell.swift
//  task3
//
//  Created by IMAC on 8/7/19.
//  Copyright © 2019 IMAC. All rights reserved.
//

import UIKit

class FavouriteCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var imagBtn1: UIButton!
    @IBOutlet weak var imgBtn2: UIButton!
    
    @IBOutlet weak var labelDescription: UILabel!
    
    @IBOutlet weak var priceDescription: UILabel!
    
   
    @IBOutlet weak var labelValue: UILabel!
    
    @IBOutlet weak var stackView: UIStackView!
    
    
    @IBOutlet weak var plusBtn: UIButton!
    
    
    var value = 1
    
    @IBAction func redHeart(_ sender: UIButton) {
        imgBtn2.isHidden = true
        imagBtn1.isHidden = false
    }
    @IBAction func whiteH(_ sender: UIButton) {
        imagBtn1.isHidden = true
        imgBtn2.isHidden = false
    }
    
    @IBAction func minusB(_ sender: UIButton) {
        if value > 1 {
            value -= 1
            labelValue.text = String(value)
        }
        else if value == 1 {
            plusBtn.isHidden = false
            stackView.isHidden = true
        }
    }
    
    @IBAction func plusBtn(_ sender: UIButton) {
        value += 1
        labelValue.text = String(value)
    }
  
   
    @IBAction func plusAction(_ sender: UIButton) {
        stackView.isHidden = false
        plusBtn.isHidden = true
    }
    
}
