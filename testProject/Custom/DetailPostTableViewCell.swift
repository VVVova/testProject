//
//  DetailPostTableViewCell.swift
//  testProject
//
//  Created by Developer on 16.03.2022.
//

import UIKit

class DetailPostTableViewCell: UITableViewCell {

    @IBOutlet weak var textPost: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
