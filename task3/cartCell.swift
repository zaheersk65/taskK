//
//  cartCell.swift
//  task3
//
//  Created by IMAC on 7/25/19.
//  Copyright © 2019 IMAC. All rights reserved.
//

import UIKit


class cartCell: UITableViewCell {
    
    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var lableVale1: UILabel!
    
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    
    
   
    var value = 0
    
    
    @IBAction func plusBtn(_ sender: UIButton) {
        
        value += 1
        lableVale1.text = String(value)
        
        
        
    }
    @IBAction func minusBtn(_ sender: UIButton) {
        
        if value >= 1 {
            value -= 1
            lableVale1.text = String(value)
        }
        
    }
    
}
