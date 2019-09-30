//
//  tabBarController.swift
//  task3
//
//  Created by IMAC on 7/17/19.
//  Copyright © 2019 IMAC. All rights reserved.
//

import UIKit
import Foundation

class tabBarController: UITabBarController,UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        self.tabBarController?.tabBar.items?[0].image = UIImage(named: "home")
//        self.tabBarController?.tabBar.items?[1].image = UIImage(named: "favourite")
         self.tabBarController?.tabBar.items![0].image = UIImage(named: "home")
    }
    
//   This is used for sliding tabs
//    extension tabBarController where Self: UIViewController {
//        func initSwipe( direction:         UISwipeGestureRecognizer.Direction){
//            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(TabBarSwitcher.handleSwipes(_:)))
//            swipe.direction = direction
//            self.view.addGestureRecognizer(swipe)
//        }
//    }
//
//    @objc protocol tabBarController {
//        func handleSwipes(sender:UISwipeGestureRecognizer)
//    }
//    override func viewDidLayoutSubviews() {
//           self.tabBarController!.tabBar.frame = CGRect(x: 0, y: 0, width:300 , height: 50)
//    }
    
    

}

