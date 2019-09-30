//
//  MyAccount.swift
//  task3
//
//  Created by IMAC on 7/19/19.
//  Copyright © 2019 IMAC. All rights reserved.
//

import UIKit

class MyAccount: UIViewController {
    
    
    @IBOutlet weak var first: UITextField!
    
    @IBOutlet weak var last: UITextField!
    
    @IBOutlet weak var phone: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var done: UIBarButtonItem!
    @IBOutlet weak var edit: UIBarButtonItem!
    @IBOutlet weak var save: UIButton!
    @IBOutlet weak var date: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        done.isEnabled = false
        first.isEnabled = false
        last.isEnabled = false
        phone.isEnabled = false
        email.isEnabled = false
        date.isEnabled = false
        save.isHidden = true
        
        save.layer.cornerRadius = 7.0
        
    }
    
    
    @IBAction func doneBtn(_ sender: UIBarButtonItem) {
        
        first.isEnabled = false
        last.isEnabled = false
        phone.isEnabled = false
        email.isEnabled = false
        date.isEnabled = false
        save.isHidden = true
        done.isEnabled = false
        edit.isEnabled = true
    
        
    }
    @IBAction func editBtn(_ sender: UIBarButtonItem) {
        done.isEnabled = true
        first.isEnabled = true
        last.isEnabled = true
        phone.isEnabled = true
        email.isEnabled = true
        date.isEnabled = true
        save.isHidden = false
        edit.isEnabled = false
        done.isEnabled = true
    }
    
    @IBAction func saveBtn(_ sender: UIButton) {
    }
}
