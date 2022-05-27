//
//  SectionCell.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 24.05.2022.
//

import UIKit

protocol UIdelegate {
    func goToNext() -> Void
}

class TableSectionCell: UITableViewCell {
    @IBOutlet var sectionLabel: UILabel!
    @IBOutlet var sectionCollectionView: UICollectionView!
    var delegate: UIdelegate?
    
    @IBAction func allButtonPressed(_ sender: UIButton) {
        delegate?.goToNext()
    }
    
    var films: [Movie] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        sectionCollectionView.dataSource = self
        sectionCollectionView.delegate = self
    }
}

extension TableSectionCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return films.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! CollectionSectionCell
        cell.setUp(with: films[indexPath.row])
        return cell
    }
}
