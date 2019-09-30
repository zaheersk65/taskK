//
//  TableView1.swift
//  task3
//
//  Created by IMAC on 7/18/19.
//  Copyright © 2019 IMAC. All rights reserved.
//

import UIKit

class TableView1: UITableViewCell {

    @IBOutlet weak var description1: UILabel!
    @IBOutlet weak var tittle1: UILabel!
    @IBOutlet weak var imageView1: UIImageView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
