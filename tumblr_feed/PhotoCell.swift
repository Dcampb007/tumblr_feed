//
//  PhotoCell.swift
//  tumblr_feed
//
//  Created by Andre Campbell on 9/3/18.
//  Copyright © 2018 Andre Campbell. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    var urlString: String = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
