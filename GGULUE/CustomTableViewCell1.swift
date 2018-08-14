//
//  CustomTableViewCell1.swift
//  GGULUE
//
//  Created by Eujeong's MacBook Pro on 2018. 8. 13..
//  Copyright © 2018년 GGULUE. All rights reserved.
//

import UIKit

class CustomTableViewCell1: UITableViewCell {

    @IBOutlet weak var allTitle: UILabel!
    @IBOutlet weak var allDetail: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
