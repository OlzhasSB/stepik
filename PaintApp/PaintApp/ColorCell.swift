//
//  ColorCell.swift
//  PaintApp
//
//  Created by Olzhas Seiilkhanov on 14.06.2022.
//

import UIKit

class ColorCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(color: UIColor) {
        self.backgroundColor = color
    }
}
