//
//  TableViewCell.swift
//  SwiftLesson2
//
//  Created by Gulia_Is on 27.03.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var imageInTableViewCell: UIImageView!
    @IBOutlet weak var labelInTableViewCell: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
