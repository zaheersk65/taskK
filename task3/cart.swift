//
//  cart.swift
//  task3
//
//  Created by IMAC on 7/16/19.
//  Copyright © 2019 IMAC. All rights reserved.
//

import UIKit

class cart: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cartCell") as! cartCell
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "My Cart!"

        // Do any additional setup after loading the view.
    }
    

    

}

