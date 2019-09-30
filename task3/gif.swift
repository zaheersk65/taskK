//
//  gif.swift
//  task3
//
//  Created by IMAC on 8/1/19.
//  Copyright © 2019 IMAC. All rights reserved.
//

import UIKit

class gif: UIViewController {

    @IBOutlet weak var imageViewq: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        //navigationController?.setNavigationBarHidden(true, animated: false) //This is to hide navigation bar
        
        imageViewq.image = UIImage.gif(name: "kiranaKing")
        
        Timer.scheduledTimer(timeInterval: 11, target: self, selector: #selector(nextFile), userInfo: nil, repeats: false)
        
        
    }
    
    @objc func nextFile() {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(true, animated: false)
//    }

//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        navigationController?.setNavigationBarHidden(true, animated: false)
//    }
   

}
