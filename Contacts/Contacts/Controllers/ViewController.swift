//
//  ViewController.swift
//  Contacts
//
//  Created by Olzhas Seiilkhanov on 02.06.2022.
//

import UIKit

class ViewController: UIViewController {

    var data = Data()
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contacts"
        setupTableView()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddContact))
    }
    
    func setupTableView() {
        view.addSubview(tableView)
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
    
    @objc func handleAddContact() {
        
        let controller = AddContactViewController()
        controller.delegate = self
        
        self.present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.contacts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell") as! ContactCell
        cell.assignParameters(data.contacts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = ContactDetailsViewController()
        detailsVC.name = data.contacts[indexPath.row].name
        detailsVC.number = data.contacts[indexPath.row].number
        detailsVC.imageView = data.contacts[indexPath.row].photo
        
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            data.contacts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
//        else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//        }
    }
    
}

extension ViewController: AddContactDelegate {
    func addContact(contact: Contact) {
        self.dismiss(animated: true) {
            self.data.contacts.append(contact)
            self.tableView.reloadData()
        }
    }
}

extension ViewController: DeleteContactDelegate {
    func deleteContact() {
        self.data.contacts.remove(at: 0)
        tableView.deleteRows(at: [[0,0]], with: .fade)
        self.tableView.reloadData()
    }
}
