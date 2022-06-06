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
    private var networkManager = NetworkManager.shared
    
//    let data = RawData()
    var movies: [Movie] = []
    private var genres: [Genre] = [] {
        didSet {
            genreCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        register()
        loadGenres()
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
//            vc.label = data.movies[indexPath.row].title
//            vc.date = data.movies[indexPath.row].releaseDate
//            vc.posterImage = data.movies[indexPath.row].poster
//            vc.movieDetailsText = data.movies[indexPath.row].details
//            vc.actors = data.movies[indexPath.row].actors!
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return data.movies.count
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! MovieCell
        cell.setUp(with: movies[indexPath.row])
        return cell
    }
}

extension MovieNewsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 19
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "genreCell", for: indexPath) as! GenreCell
        if genres.count > 0 {
            cell.setUp(with: genres[indexPath.row])
        }
        return cell
    }
}

extension MovieNewsViewController {
    private func loadGenres() {
        networkManager.loadGenres { [weak self] genres in
            self?.genres = genres
        }
    }
}
