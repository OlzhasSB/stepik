//
//  ViewController.swift
//  Contacts
//
//  Created by Olzhas Seiilkhanov on 02.06.2022.
//

import UIKit

class ViewController: UIViewController {


    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "contactCell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        
        return cell
    }
}


//var deleteButton: UIButton = {
//    let button = UIButton(frame: CGRect(x: 20, y: UIScreen.main.bounds.height-80, width: UIScreen.main.bounds.width*0.9, height: 40))
//    button.setTitle("Delete", for: .normal)
//    button.backgroundColor = .red
//    button.titleLabel?.textColor = .white
//    return button
//}()
//
//var callButton: UIButton = {
//    let button = UIButton(frame: CGRect(x: 20, y: UIScreen.main.bounds.height-130, width: UIScreen.main.bounds.width*0.9, height: 40))
//    button.setTitle("Call", for: .normal)
//    button.backgroundColor = .systemBlue
//    button.titleLabel?.textColor = .white
//    return button
//}()
//
//var nameLabel: UILabel = {
//    let label = UILabel(frame: CGRect(x: 20, y: 40, width: UIScreen.main.bounds.width*0.9, height: 40))
//    label.text = "Name and Surname"
//    label.font = .systemFont(ofSize: 24, weight: .bold)
//    label.textAlignment = .center
//    return label
//}()
//
//var numberLabel: UILabel = {
//    let label = UILabel(frame: CGRect(x: 20, y: 80, width: UIScreen.main.bounds.width*0.9, height: 40))
//    label.text = "87777777777"
//    label.font = .systemFont(ofSize: 24, weight: .bold)
//    label.textAlignment = .center
//    return label
//}()
