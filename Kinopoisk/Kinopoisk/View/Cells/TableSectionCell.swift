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
    var delegate: UIdelegate?
    
    private var movies: [Movie] = [] {
        didSet {
            sectionCollectionView.reloadData()
        }
    }
    
    @IBOutlet var sectionLabel: UILabel!
    @IBOutlet var sectionCollectionView: UICollectionView!
    @IBAction func allButtonPressed(_ sender: UIButton) {
        delegate?.goToNext()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        sectionCollectionView.dataSource = self
        sectionCollectionView.delegate = self
    }
    
    func configure(with viewModel: (title: String?, movies: [Movie])) {
        self.sectionLabel.text = viewModel.title
        self.movies = viewModel.movies
    }
}

extension TableSectionCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! CollectionSectionCell
        cell.setUp(with: movies[indexPath.row])
        return cell
    }
}
