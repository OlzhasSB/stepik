//
//  ViewController.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 16.05.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var myTableView: UITableView!
    
    
    var movies: [Movies] = [
        Movies.init(label: "Sonic the Hedgehog", date: "2021-03-03", rating: "★8.7", image: UIImage.init(named: "sonic.jpeg")),
        Movies.init(label: "The Batman", date: "2022-03-01", rating: "★7.5", image: UIImage.init(named: "batman.jpeg")),
        Movies.init(label: "The Avengers", date: "2019-02-03", rating: "★7.9", image: UIImage.init(named: "avengers.jpeg"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! MovieCell
        cell.movieDateLabel.text = movies[indexPath.row].date
        cell.movieImageView.image = movies[indexPath.row].image
        cell.movieTitleLable.text = movies[indexPath.row].label
        cell.movieRating.text = movies[indexPath.row].rating
        
        return cell
    }
}
