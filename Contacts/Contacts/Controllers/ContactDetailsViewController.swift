//
//  ContactDetailsViewController.swift
//  Contacts
//
//  Created by Olzhas Seiilkhanov on 03.06.2022.
//

import UIKit

protocol DeleteContactDelegate {
    func deleteContact()
}

class ContactDetailsViewController: UIViewController {

    var delegate: DeleteContactDelegate?
    
    var contactImageView = UIImageView()
    var deleteButton = UIButton()
    var callButton = UIButton()
    var nameLabel = UILabel()
    var numberLabel = UILabel()
    
    var imageView: UIImage!
    var name: String!
    var number: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Second"
        view.backgroundColor = .white
        
        view.addSubview(nameLabel)
        view.addSubview(numberLabel)
        view.addSubview(callButton)
        view.addSubview(deleteButton)
        view.addSubview(contactImageView)
            
        configureImageView()
        configureNameLabel()
        configureNumberLabel()
        configureCallButton()
        configureDeleteButton()
        
        assignParameters()
    }
    
    func assignParameters() {
        nameLabel.text = name
        contactImageView.image = imageView
        numberLabel.text = number
    }
    
    @objc func deleteButtonTapped() {
        delegate?.deleteContact()
    }
    
    // MARK: - Constraints
    
    func configureImageView() {
        contactImageView.translatesAutoresizingMaskIntoConstraints = false
        contactImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        contactImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        contactImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        contactImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }

    func configureNameLabel() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: contactImageView.topAnchor, constant: 15).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant: 20).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        nameLabel.text = "Name Surname"
    }

    func configureNumberLabel() {
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        numberLabel.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant: 20).isActive = true
        numberLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        numberLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        numberLabel.textAlignment = .center
        numberLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        numberLabel.text = "877777777"
    }
    
    func configureCallButton() {
        callButton.translatesAutoresizingMaskIntoConstraints = false
        callButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -130).isActive = true
        callButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        callButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        callButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        callButton.backgroundColor = .systemGreen
        callButton.setTitle("Call", for: .normal)
        callButton.titleLabel?.textColor = .white
    }
    
    func configureDeleteButton() {
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
        deleteButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        deleteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        deleteButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        deleteButton.backgroundColor = .red
        deleteButton.setTitle("Delete", for: .normal)
        deleteButton.titleLabel?.textColor = .white
        deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
    }
}
