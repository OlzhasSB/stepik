//
//  ContactCell.swift
//  Contacts
//
//  Created by Olzhas Seiilkhanov on 02.06.2022.
//

import UIKit

class ContactCell: UITableViewCell {
    
    var contactImageView = UIImageView()
    var contactNameLabel = UILabel()
    var contactNumberLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImageView() {
        contactImageView.translatesAutoresizingMaskIntoConstraints = false
        contactImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        contactImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        contactImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        contactImageView.widthAnchor.constraint(equalTo: contactImageView.heightAnchor, multiplier: 16/9).isActive = true
    }
    
    func configureNameLabel() {
        contactNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contactNameLabel.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant: 20).isActive = true
        contactNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
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
