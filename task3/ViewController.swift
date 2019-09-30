//
//  ViewController.swift
//  task3
//
//  Created by IMAC on 7/15/19.
//  Copyright © 2019 IMAC. All rights reserved.
//

import UIKit


class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate {
   
    @IBOutlet weak var go: UIButton!
    @IBOutlet weak var dropbt: UIButton!
    
    @IBOutlet weak var selectBtn: UIButton!
    
    @IBOutlet weak var up: UIImageView!
    @IBOutlet weak var down: UIImageView!
    var array = [" Bengaluru"," Jaipur"," Kanpur"," New Delhi"]

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        go.layer.cornerRadius = 7
        tableView.isHidden = true
        
       go.isEnabled = false
        
       up.isHidden = true
       
    }
 
    
    @IBAction func dropBtn(_ sender: UIButton) {
        go.isEnabled = true
        if tableView.isHidden {
            self.tableView.isHidden = false
            
            up.isHidden = false
            down.isHidden = true

            
            
        }else {
            self.tableView.isHidden = true
            
            down.isHidden = false
            up.isHidden = true
           
        }
        // go.isEnabled = true
    }
    func animated(toogle: Bool) {
        if toogle {
            UIView.animate(withDuration : 0.3) {
                self.tableView.isHidden = false
            }
            
        }else {
            UIView.animate(withDuration : 0.3) {
                self.tableView.isHidden = true
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableCell") as! TableCell
        cell.labelTitle.text = array[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dropbt.setTitle("\(array[indexPath.row])", for: .normal)
        animated(toogle: false)
    }
  
  
    @IBAction func goNext(_ sender: UIButton) {
        
        
        
        if dropbt.isSelected == true {
        
            let alert = UIAlertController(title: "alert", message: "Select City", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in //Cancel Action
            } ))
            
            
        
        }else  {
            
            let story = UIStoryboard(name: "Main", bundle:  nil)
            let vc = story.instantiateViewController(withIdentifier: "mobilePage") as! mobilePage
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func nexrt(_ sender: UIButton) {
        let story = UIStoryboard(name: "Main", bundle:  nil)
        let vc = story.instantiateViewController(withIdentifier: "shoppingPage")
        self.navigationController?.pushViewController(vc, animated: true)

    }
   
    
}


//let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
//swipeRight.direction = UISwipeGestureRecognizer.Direction.right
//self.view.addGestureRecognizer(swipeRight)
//
//let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
//swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
//self.view.addGestureRecognizer(swipeLeft)
//
//@objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
//
//    if let swipeGesture = gesture as? UISwipeGestureRecognizer {
//
//
//        switch swipeGesture.direction {
//        case UISwipeGestureRecognizer.Direction.right:
//
//            print("Swiped right")
//
//        case UISwipeGestureRecognizer.Direction.left:
//
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let vc = storyboard.instantiateViewController(withIdentifier: "TableViewController") as! TableViewController
//            self.navigationController?.pushViewController(vc, animated: true)
//
//            print("Swiped left")
//        case UISwipeGestureRecognizer.Direction.up:
//            print("Swiped up")
//        default:
//            break
//        }
//    }
//}
