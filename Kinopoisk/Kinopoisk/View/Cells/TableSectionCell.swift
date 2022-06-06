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
    
    var genres: [Genre] = []
    
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
    
    func configure(with viewModel: (title: String?, movies: [Movie]), genres: [Genre]) {
        self.sectionLabel.text = viewModel.title
        self.movies = viewModel.movies
        self.genres = genres
    }
}

extension TableSectionCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 128, height: 270)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! CollectionSectionCell
        cell.setUp(with: movies[indexPath.row], genres: genres)
        return cell
    }
}
