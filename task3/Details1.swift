//
//  Details1.swift
//  task3
//
//  Created by IMAC on 7/24/19.
//  Copyright © 2019 IMAC. All rights reserved.
//

import UIKit

class Details1: UIViewController {
    
    @IBOutlet weak var imageViewq: UIImageView!
    
    
    @IBOutlet weak var description1: UILabel!
    
    @IBOutlet weak var stack: UIStackView!
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var addCart: UIButton!
    @IBOutlet weak var gram: UILabel!
    
    
    var label:String?
    var imageto:UIImage?
    var priceLabel:String?
    
   
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        description1.text = label
        imageViewq.image = imageto
        price.text = priceLabel
        
        stack.isHidden = true
        
        
    }
    
    var value = 1
    
    
    
    
    
    @IBAction func plus(_ sender: UIButton) {
        value += 1
        valueLabel.text = String(value)
        
        
    }
    
    @IBAction func minus(_ sender: UIButton) {
        
       
        if value > 1 {
             value -= 1
            valueLabel.text = String(value)  
        }
        else if value == 1{
            addCart.isHidden = false
            stack.isHidden = true
        }
    }
    @IBAction func addAction(_ sender: UIButton) {
        addCart.isHidden = true
        stack.isHidden = false
    }
    
    
    
    
}
