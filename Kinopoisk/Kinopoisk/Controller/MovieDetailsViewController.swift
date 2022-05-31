//
//  HomeViewController.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 23.05.2022.
//

import UIKit

class MovieDetailsViewController: UIViewController, MovieManagerDelegate {
    var films = MovieData(results: [])
    
    @IBOutlet private var myCollectionView: UICollectionView!
    @IBOutlet private var movieDetailsLabel: UILabel!
    @IBOutlet private var posterImageView: UIImageView!
    @IBOutlet private var movieTitleLabel: UILabel!
    @IBOutlet private var movieDateLabel: UILabel!
    
    var label: String!
    var date: String!
    var movieDetailsText: String!
    var posterImage: UIImage!
//    var actors: [PersonEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        assign()
    }
    
    private func register() {
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
    }
    
    private func assign() {
//        movieDetailsLabel.text = movieDetailsText
//        posterImageView.image = posterImage
//        movieTitleLabel.text = label
//        movieDateLabel.text = date
        title = label
    }
    
    
    func didUpdateMovies(movieList: MovieData) {
//        films = movieList
//        print(films.results[0].overview)
    }
    
}

extension MovieDetailsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return actors.count
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CastCell
//        cell.setUp(with: actors[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "CastMemberViewController") as? CastMemberViewController {
//            vc.castImage = actors[indexPath.row].image
//            vc.castName = actors[indexPath.row].name
//            vc.castBirthday = actors[indexPath.row].birthday
//            vc.castDepartment = actors[indexPath.row].status
//            vc.castBiography = actors[indexPath.row].biography
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
