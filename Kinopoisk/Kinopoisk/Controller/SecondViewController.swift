//
//  secondViewController.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 17.05.2022.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet var myCollectionView: UICollectionView!
    @IBOutlet var movieDetailsLabel: UILabel!
    @IBOutlet var posterImageView: UIImageView!
    
    var movieDetailsText: String!
    var posterImage: UIImage!
    var actors: [Cast] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.dataSource = self
        movieDetailsLabel.text = movieDetailsText
        posterImageView.image = posterImage
    }
}

extension SecondViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return actors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CastCell
        cell.setUp(with: actors[indexPath.row])
        return cell
    }
}
