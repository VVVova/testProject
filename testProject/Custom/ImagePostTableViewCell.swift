//
//  ImagePostTableViewCell.swift
//  testProject
//
//  Created by Developer on 16.03.2022.
//

import UIKit

class ImagePostTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var imagePost: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
