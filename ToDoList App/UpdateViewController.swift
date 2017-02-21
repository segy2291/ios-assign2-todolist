//
//  UpdateViewController.swift
//  ToDoList App
//Student Name: Ranipa Sagar
// Student Id:300914091

//  Created by Sagar patel on 2017-02-21.
//  Copyright © 2017 segy. All rights reserved.
//

import UIKit
import UIKit
import Firebase
import FirebaseDatabase


class UpdateViewController: UIViewController {
    var pojoo : newobject!
    @IBOutlet weak var textbox1: UITextField!
    @IBOutlet weak var textbox2: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        textbox1.text = pojoo.list
        textbox2.text = pojoo.msg
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var databaseref : FIRDatabaseReference!
    {
        return FIRDatabase.database().reference()
    }
    
    
    @IBAction func update(_ sender: UIButton) {
        
        
        let text1 = textbox1.text
        let text2 = textbox2.text
        let pojoobj = newobject (list: text1!, msg: text2!)
        var key = pojoo.ref!.key
        let updateref = databaseref.child("/tododatabaselist/\(key)/")
        updateref.updateChildValues(pojoobj.toAnyObject())        //todoref.setValue(pojoobj.toAnyObject())
        //self.navigationController?.popToViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
        self.navigationController?.popViewController(animated: true)
        // self.navigationController?.popToViewControllerAnimated(true)
        

    }
    
    
}
