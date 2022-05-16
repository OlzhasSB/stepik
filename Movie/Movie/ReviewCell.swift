//
//  ReviewCell.swift
//  Movie
//
//  Created by Olzhas Seiilkhanov on 16.05.2022.
//

import UIKit

class ReviewCell: UITableViewCell {
    @IBOutlet var reviewerNameLabel: UILabel!
    @IBOutlet var reviewerCommentLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
