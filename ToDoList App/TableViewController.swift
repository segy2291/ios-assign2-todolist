//
//  ToDoList App
//
//  Created by Sagar patel on 2017-02-21.
//  Copyright © 2017 segy. All rights reserved.
// Student Name: Ranipa Sagar
// Student Id:300914091

import UIKit
import Firebase
import FirebaseDatabase

class TableViewController: UITableViewController {
    var array = [newobject]()
    var databaseRef : FIRDatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        databaseRef = FIRDatabase.database().reference().child("tododatabaselist")
        
        databaseRef.observe(.value, with: {(snapshot) in
            
            var newarray = [newobject]()
            
            for item in snapshot.children{
                let newTodo = newobject(snapshot : item as! FIRDataSnapshot)
                newarray.insert(newTodo, at: 0)
                
            }
            self.array = newarray
            self.tableView.reloadData()
        })
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
         return array.count
       // return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell

        cell.celllabel?.text = array[indexPath.row].list
       // cell.label2?.text = array[indexPath.row].txt2
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
             let ref = array[indexPath.row].ref
            ref?.removeValue()
            array.remove(at: indexPath.row)
           // tableView.deleteRows(at: [indexPath], with: .fade)
            
    }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   // override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //performSegue(withIdentifier: "update", sender: self)
  //  }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "update" {
            let vc = segue.destination as! UpdateViewController
            let indexpath = tableView.indexPathForSelectedRow!
           vc.pojoo = array[indexpath.row]
        
       }

}
}
