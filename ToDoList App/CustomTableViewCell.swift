//
//  CustomTableViewCell.swift
//  
//Student Name: Ranipa Sagar
// Student Id:300914091

//  Created by Sagar patel on 2017-02-21.
//
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var cellswitch: UISwitch!
    @IBOutlet weak var celllabel: UILabel!
    


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        
          if(sender.isOn) {
                celllabel.textColor = UIColor.black
                celllabel.font = UIFont.boldSystemFont(ofSize: 20)
            }
            else {
                celllabel.textColor = UIColor.lightGray
                celllabel.font = UIFont.italicSystemFont(ofSize: 20)
            }
        }

    

}
