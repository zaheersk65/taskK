//
//  CollectionCell.swift
//  task3
//
//  Created by IMAC on 7/16/19.
//  Copyright © 2019 IMAC. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
  
    @IBOutlet weak var labelText: UILabel!
    
}

//This is used to rotate the label left/right and Reverse

//yourLabelName.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2) //Left 90*
//yourLabelName.transform = CGAffineTransform(rotationAngle: CGFloat.pi)  // REverse 180*
//yourLabelName.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)  //right 90*
