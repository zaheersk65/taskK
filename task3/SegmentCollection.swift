//
//  SegmentCollection.swift
//  task3
//
//  Created by IMAC on 8/6/19.
//  Copyright © 2019 IMAC. All rights reserved.
//

import UIKit

class SegmentCollection: UICollectionViewCell {
    
    @IBOutlet weak var collectionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionLabel.alpha = 0.6
    }

    override var isSelected: Bool {
        didSet{
            collectionLabel.alpha = isSelected ? 1.0 : 0.6
        }

}
}
