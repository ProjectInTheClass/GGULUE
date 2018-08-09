//
//  FavoriteTableViewCell.swift
//  GGULUE
//
//  Created by KimYoungHoon on 2018. 8. 3..
//  Copyright © 2018년 GGULUE. All rights reserved.
//

import UIKit

protocol ChangeLectureTimeTable {
    func changeLecture(_ sender: UITableViewCell, _ boolValue:Bool)
}

class FavoriteTableViewCell: UITableViewCell {
    @IBOutlet weak var customTextLabel: UILabel!
    @IBOutlet weak var customButton: UIButton!
    
    var delegate : ChangeLectureTimeTable!
    
    @IBAction func changeButton(_ sender: Any) {
        if customButton.isSelected == true{
            customButton.isSelected = false
        }else{
            customButton.isSelected = true
        }
        
        delegate.changeLecture(self, customButton.isSelected)
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
