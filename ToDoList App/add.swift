//
//  add.swift
// ToDoList App
// Student Name: Ranipa Sagar
// Student Id:300914091

//  Created by Sagar patel on 2017-02-21.
//  Copyright © 2017 segy. All rights reserved.
//

import UIKit
import UIKit
import Firebase
import FirebaseDatabase

class add: UIViewController {
    
    @IBOutlet weak var textbox1: UITextField!
    @IBOutlet weak var textbox2: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var databaseref : FIRDatabaseReference!
    {
        return FIRDatabase.database().reference()
    }
    
   
    
    @IBAction func todobtnadd(_ sender: AnyObject) {
        let todoref = databaseref.child("tododatabaselist").childByAutoId()
        
        let text1 = textbox1.text
        let text2 = textbox2.text
        let pojoobj = newobject (list: text1!, msg: text2!)
        todoref.setValue(pojoobj.toAnyObject())
        //self.navigationController?.popToViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
        self.navigationController?.popViewController(animated: true)
        // self.navigationController?.popToViewControllerAnimated(true)

    }
    
}
