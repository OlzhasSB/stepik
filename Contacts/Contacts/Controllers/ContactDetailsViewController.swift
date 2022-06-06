//
//  ContactDetailsViewController.swift
//  Contacts
//
//  Created by Olzhas Seiilkhanov on 03.06.2022.
//

import UIKit

protocol UpdateContactDelegate: AnyObject {
    func deleteContact(index: IndexPath)
    func editContact(contact: Contact, index: IndexPath)
}

class ContactDetailsViewController: UIViewController {
    
    weak var delegate: UpdateContactDelegate?
    
    var imageView: UIImage!
    var name: String!
    var number: String!
    var gender: String!
    var index: IndexPath!
    
    private var contactImageView = UIImageView()
    private var deleteButton = UIButton()
    private var callButton = UIButton()
    private var nameLabel = UILabel()
    private var numberLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(handleEditContact))
        
        configureImageView()
        configureNameLabel()
        configureNumberLabel()
        configureCallButton()
        configureDeleteButton()
        
        assignParameters()
    }
    
    private func assignParameters() {
        nameLabel.text = name
        contactImageView.image = imageView
        numberLabel.text = number
    }
    
    @objc private func deleteButtonTapped() {
        delegate?.deleteContact(index: index)
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func handleEditContact() {
        let editVC  = EditContactViewController()
        editVC.currentName = name
        editVC.currentNumber = number
        editVC.currentGender = gender
        editVC.index = index
        
        editVC.delegate = delegate
        navigationController?.pushViewController(editVC, animated: true)
    }
    
// MARK: - Configure UI elements
    
    private func configureImageView() {
        view.addSubview(contactImageView)
        
        contactImageView.translatesAutoresizingMaskIntoConstraints = false
        contactImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        contactImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        contactImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        contactImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }

    private func configureNameLabel() {
        view.addSubview(nameLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: contactImageView.topAnchor, constant: 15).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant: 20).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    }

    private func configureNumberLabel() {
        view.addSubview(numberLabel)
        
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        numberLabel.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant: 20).isActive = true
        numberLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        numberLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        numberLabel.textAlignment = .center
        numberLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    }
    
    private func configureCallButton() {
        view.addSubview(callButton)
        
        callButton.translatesAutoresizingMaskIntoConstraints = false
        callButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -130).isActive = true
        callButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        callButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        callButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        callButton.backgroundColor = .systemGreen
        callButton.setTitle("Call", for: .normal)
        callButton.titleLabel?.textColor = .white
    }
    
    private func configureDeleteButton() {
        view.addSubview(deleteButton)
        
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

