//
//  secondViewController.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 17.05.2022.
//

import UIKit

class secondViewController: UIViewController {
    @IBOutlet var myCollectionView: UICollectionView!
    var actors: [Cast] = [
        Cast.init(name: "James Marsden", status: "Acting", image: UIImage(named: "james.jpeg")),
        Cast.init(name: "Jim Carrey", status: "Acting", image: UIImage(named: "jim.jpeg")),
        Cast.init(name: "Ben Schwartz", status: "Acting", image: UIImage(named: "ben.jpeg")),
        Cast.init(name: "Tika Sumpter", status: "Acting", image: UIImage(named: "tika.jpeg")),
        Cast.init(name: "Natasha Rothwell", status: "Acting", image: UIImage(named: "natasha.jpeg")),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.dataSource = self
    }
    
}

extension secondViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return actors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CastCell
        cell.setUp(with: actors[indexPath.row])
        
        return cell
    }
    
    
}
