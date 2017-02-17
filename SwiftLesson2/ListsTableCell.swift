//
//  ListsTableCell.swift
//  SwiftLesson2
//
//  Created by Rustam N on 16.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import UIKit

class ListsTableCell: UITableViewCell {
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
