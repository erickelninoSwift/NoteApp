//
//  TableViewCell.swift
//  MyNotesElnino
//
//  Created by El nino Cholo on 2020/07/01.
//  Copyright © 2020 El nino Cholo. All rights reserved.
//

import UIKit
import CoreData

class TableViewCell: UITableViewCell {
    
 
    @IBOutlet weak var esditbutton: UIButton!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    
    @IBOutlet weak var titlenotes1: UILabel!
    @IBOutlet weak var detailsnotes: UITextView!
    @IBOutlet weak var timesnotes: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(yourNotes:ErickNotes)
    {
        titlenotes1.text = yourNotes.title
        detailsnotes.text = yourNotes.details
        timesnotes.text = "\(yourNotes.date!)"
    }
   
   
    
}
