//
//  TableViewCell.swift
//  SwiftLesson2
//
//  Created by Наталья on 17.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak  var imageTableCell: UIImageView!
    @IBOutlet weak  var labelTableCell: UILabel!
    override func awakeFromNib() {
    
     
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
