//
//  ContactCell.swift
//  Contacts
//
//  Created by Olzhas Seiilkhanov on 02.06.2022.
//

import UIKit

class ContactCell: UITableViewCell {
    
    private var contactImageView = UIImageView()
    private var contactNameLabel = UILabel()
    private var contactNumberLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(contactNameLabel)
        contentView.addSubview(contactImageView)
        contentView.addSubview(contactNumberLabel)
        
        configureImageView()
        configureNameLabel()
        configureNumberLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(_ contact: Contact) {
        contactNameLabel.text = contact.name
        contactImageView.image = contact.photo
        contactNumberLabel.text = contact.number
    }
    
    func configureImageView() {
        contactImageView.translatesAutoresizingMaskIntoConstraints = false
        contactImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        contactImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        contactImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        contactImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func configureNameLabel() {
        contactNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contactNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        contactNameLabel.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant: 20).isActive = true
        contactNameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        contactNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        contactNameLabel.textAlignment = .center
        contactNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    }
    
    func configureNumberLabel() {
        contactNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        contactNumberLabel.topAnchor.constraint(equalTo: contactNameLabel.bottomAnchor, constant: 5).isActive = true
        contactNumberLabel.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant: 20).isActive = true
        contactNumberLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        contactNumberLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        contactNumberLabel.textAlignment = .center
        contactNumberLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    }
}
