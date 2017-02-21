//
//  struct.swift
//  ToDoList App
//Student Name: Ranipa Sagar
// Student Id:300914091

//  Created by Sagar patel on 2017-02-21.
//  Copyright © 2017 segy. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

struct newobject {
    var list :String!
    var msg: String!
    var ref : FIRDatabaseReference!
    var key : String!
    
    init(list : String, msg : String, key : String = "") {
        self.list = list
        self.msg = msg
        self.key = key
        self.ref = FIRDatabase.database().reference()
    }
    
    init(snapshot : FIRDataSnapshot) {
        
        let value = snapshot.value as? NSDictionary
        
        self.list = value?["list"] as! String
        self.msg = value?["msg"] as! String
        self.key = snapshot.key
        self.ref = snapshot.ref
        
    }
    
    func toAnyObject() -> [String : AnyObject]
    {
        return["list" : list as AnyObject , "msg" : msg as AnyObject]
    }
}
