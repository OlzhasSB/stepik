//
//  ViewController.swift
//  Contacts
//
//  Created by Olzhas Seiilkhanov on 02.06.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private var contactList = Data()
    private let tableView = UITableView()
    private let emptyLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contacts"
        view.addSubview(tableView)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddContact))
        setupTableView()
        setupEmptyLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if contactList.contacts.isEmpty {
            emptyLabel.isHidden = false
        } else {
            emptyLabel.isHidden = true
        }
    }
     
    @objc private func handleAddContact() {
        let controller = AddContactViewController()
        controller.delegate = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ContactCell.self, forCellReuseIdentifier: "contactCell")
        tableView.rowHeight = 120
    
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupEmptyLabel() {
        view.addSubview(emptyLabel)
        
        emptyLabel.translatesAutoresizingMaskIntoConstraints = false
        emptyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emptyLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        emptyLabel.text = "No contacts"
        emptyLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        emptyLabel.isHidden = true
    }
}

// MARK: - TableView Protocols

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.contacts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell") as! ContactCell
        cell.assignParameters(contactList.contacts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = ContactDetailsViewController()
        detailsVC.name = contactList.contacts[indexPath.row].name
        detailsVC.number = contactList.contacts[indexPath.row].number
        detailsVC.imageView = contactList.contacts[indexPath.row].photo
        detailsVC.gender = contactList.contacts[indexPath.row].gender
        detailsVC.index = indexPath
        
        detailsVC.delegate = self
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            contactList.contacts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            if contactList.contacts.isEmpty {
                emptyLabel.isHidden = false
            } else {
                emptyLabel.isHidden = true
            }
        }
    }
}

// MARK: - Add/Update Delegates

extension MainViewController: AddContactDelegate {
    func addContact(contact: Contact) {
        self.contactList.contacts.append(contact)
        self.tableView.reloadData()
    }
}

extension MainViewController: UpdateContactDelegate {
    func deleteContact(index: IndexPath) {
        self.contactList.contacts.remove(at: index.row)
        self.tableView.deleteRows(at: [index], with: .fade)
        self.tableView.reloadData()
    }
    
    func editContact(contact: Contact, index: IndexPath) {
        self.contactList.contacts[index.row] = contact
        self.tableView.reloadData()
    }
}

