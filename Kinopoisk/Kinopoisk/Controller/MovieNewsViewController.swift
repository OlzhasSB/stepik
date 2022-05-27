//
//  ViewController.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 16.05.2022.
//

import UIKit

class MovieNewsViewController: UIViewController {
    @IBOutlet private var myTableView: UITableView!
    @IBOutlet private var genreCollectionView: UICollectionView!
    
    let data = RawData()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        register()
    }
    
    private func register() {
        myTableView.delegate = self
        myTableView.dataSource = self
        genreCollectionView.dataSource = self
    }
}

extension MovieNewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "MovieDetailsViewController") as? MovieDetailsViewController {
            vc.label = data.movies[indexPath.row].title
            vc.date = data.movies[indexPath.row].releaseDate
            vc.posterImage = data.movies[indexPath.row].poster
            vc.movieDetailsText = data.movies[indexPath.row].details
            vc.actors = data.movies[indexPath.row].actors!
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! MovieCell
        cell.setUp(with: data.movies[indexPath.row])
        return cell
    }
}

extension MovieNewsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "genreCell", for: indexPath) as! GenreCell
        cell.setUp(with: data.genres[indexPath.row])
        return cell
    }
}
