//
//  TestViewController.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 24.05.2022.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet private var sectionTableView: UITableView!
    
    private let data = Data()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        title = "Movies"
    }
    
    private func register() {
        sectionTableView.dataSource = self
        sectionTableView.delegate = self
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sectionCell") as! TableSectionCell
        cell.sectionLabel.text = data.sections[indexPath.row]
        cell.films = data.movies
        cell.delegate = self
        return cell
    }
}

extension HomeViewController: UIdelegate {
    func goToNext() {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "MovieNewsViewController") as? MovieNewsViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
