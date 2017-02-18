//
//  CustomTableViewCell.swift
//  SwiftLesson2
//
//  Created by Никита Солдатов on 18.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var customImageView: UIImageView!

    @IBOutlet weak var customTexLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
