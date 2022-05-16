//
//  MovieCell.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 16.05.2022.
//

import UIKit

class MovieCell: UITableViewCell {
    @IBOutlet var movieImageView: UIImageView!
    @IBOutlet var movieTitleLable: UILabel!
    @IBOutlet var movieDateLabel: UILabel!
    @IBOutlet var movieRating: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
