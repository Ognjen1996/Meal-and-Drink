//
//  AreaTableViewCell.swift
//  pods
//
//  Created by Ognjen on 21.10.22..
//

import UIKit

class AreaTableViewCell: UITableViewCell {

    @IBOutlet var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func populateCell(with areas: [String]) {
        for i in areas {
            label.text = i
        }
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
