//
//  secondViewController.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 17.05.2022.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet var myCollectionView: UICollectionView!
    var actors: [Cast] = []
    var about = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.dataSource = self
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
