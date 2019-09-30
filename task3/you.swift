//
//  you.swift
//  task3
//
//  Created by IMAC on 7/16/19.
//  Copyright © 2019 IMAC. All rights reserved.
//

import UIKit

class you: UIViewController,UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "youLabel", for: indexPath) as! youLabel
        cell.labelAccount.text = array[indexPath.row]
        cell.imageview1.image = image3[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        if row == 0 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyAccount") as! MyAccount
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    
    var array = ["My Account","My Address","My Order","MyShopping List","My Membership","Settings","FaQ's","About KK","Share Us","Help","Logout"]
    var image3 = [ #imageLiteral(resourceName: "avatar"),#imageLiteral(resourceName: "folder"),#imageLiteral(resourceName: "order"),#imageLiteral(resourceName: "shopping-cart (1)"),#imageLiteral(resourceName: "membership (1)"),#imageLiteral(resourceName: "settings (1)"),#imageLiteral(resourceName: "conversation (1)"),#imageLiteral(resourceName: "care-about-planet (1)"),#imageLiteral(resourceName: "share (1)"),#imageLiteral(resourceName: "question"),#imageLiteral(resourceName: "logout")]
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "My Account!"

        // Do any additional setup after loading the view.
    }
    

}
