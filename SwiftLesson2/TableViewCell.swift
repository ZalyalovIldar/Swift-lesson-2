//
//  TableViewCell.swift
//  SwiftLesson2
//
//  Created by Ленар on 15.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var tableCellLabel: UILabel!
    @IBOutlet weak var tableCellImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
