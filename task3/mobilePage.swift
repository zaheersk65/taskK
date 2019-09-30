//
//  mobilePage.swift
//  task3
//
//  Created by IMAC on 7/15/19.
//  Copyright © 2019 IMAC. All rights reserved.
//

import UIKit

class mobilePage: UIViewController {

    @IBOutlet weak var skip: UIButton!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var mobileNum: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigationController?.setNavigationBarHidden(true, animated: true) //This is to hide navigation bar
        navigationItem.setHidesBackButton(true, animated:true)
        passwordLabel.isHidden = true
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func skip(_ sender: UIButton) {
        let story = UIStoryboard(name: "Main", bundle:  nil)
        let vc = story.instantiateViewController(withIdentifier: "mapPage") as! mapPage
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidDisappear(_ animated: Bool) {
        mobileNum.text = ""
        passwordLabel.text = ""
    }
    
    
    //Here Textfield Delegate method to set password restricted to atleast 6 Digits
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool
    {
        //Atleast to 10Digits
        if textField == mobileNum {
            let minLength = 10
            let currentString: NSString = textField.text! as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length >= minLength
        }
        return true
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        
        passwordLabel.isHidden = false
        login.frame = CGRect(x: 36, y: 345, width: 307, height: 39)
        skip.frame = CGRect(x: 36, y: 410, width: 307, height: 30)
        
//        let alert = UIAlertController(title: "alert", message: nil, preferredStyle: UIAlertController.Style.alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in //Cancel Action
//        } ))
//
//        if (mobileNum.text == "" || passwordLabel.text == "") {
//            alert.message = "Enter all fields"
//            self.present(alert,animated: true)
//        }
        
        if (mobileNum.text!.count == 10 &&  passwordLabel.text != "")   {
      
        let story = UIStoryboard(name: "Main", bundle:  nil)
        let vc = story.instantiateViewController(withIdentifier: "mapPage") as! mapPage
        self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
