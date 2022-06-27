//
//  NewsFeedTableViewCell.swift
//  NewsFeedApp
//
//  Created by M1086289 on 08/06/22.
//

import UIKit

class NewsFeedTableViewCell: UITableViewCell {

    
    @IBOutlet weak var publishedLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
