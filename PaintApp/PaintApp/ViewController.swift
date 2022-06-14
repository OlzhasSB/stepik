//
//  ViewController.swift
//  PaintApp
//
//  Created by Olzhas Seiilkhanov on 14.06.2022.
//

import UIKit

class ViewController: UIViewController {

    var circleButton = UIButton()
    var triangleButton = UIButton()
    var lineButton = UIButton()
    var rectangleButton = UIButton()
    var penButton = UIButton()
    var stackView = UIStackView()
    var fillLabel = UILabel()
    var fillSwitch = UISwitch()
    var colorsCollectionView = UICollectionView()
    
    var colors: [UIColor] = [UIColor.red, UIColor.blue, UIColor.black, UIColor.brown]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureStackView()
        

    }
    
    func configureStackView() {
        view.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        setStackViewConstraints()
        
        configureCircleButton()
        configureRectangleButton()
        configureLineButton()
        configureTriangleButton()
        configurePenButton()
        configureFillLabel()
        configureSwitch()
        configureColorsCollectionView()
    }
    
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
//        stackView.backgroundColor = .red
    }
    
    func configureColorsCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        colorsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
//        view.addSubview(colorsCollectionView)
        
        
        stackView.addArrangedSubview(colorsCollectionView)
        colorsCollectionView.dataSource = self
        colorsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        colorsCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ColorCell")
    }
    
    func configureFillLabel() {
        stackView.addArrangedSubview(fillLabel)
        fillLabel.text = "Fill"
    }
    
    func configureSwitch() {
        stackView.addArrangedSubview(fillSwitch)
        fillSwitch.translatesAutoresizingMaskIntoConstraints = false
        fillSwitch.centerYAnchor.constraint(equalTo: stackView.centerYAnchor).isActive = true
    }
    
    func configureCircleButton() {
        stackView.addArrangedSubview(circleButton)
        circleButton.setImage(UIImage(named: "circle.png"), for: .normal)
        circleButton.translatesAutoresizingMaskIntoConstraints = false
        circleButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        circleButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func configureRectangleButton() {
        stackView.addArrangedSubview(rectangleButton)
        rectangleButton.setImage(UIImage(named: "rectangle.png"), for: .normal)
        rectangleButton.translatesAutoresizingMaskIntoConstraints = false
        rectangleButton.widthAnchor.constraint(equalTo: circleButton.widthAnchor).isActive = true
        rectangleButton.heightAnchor.constraint(equalTo: circleButton.heightAnchor).isActive = true
    }
    
    func configureLineButton() {
        stackView.addArrangedSubview(lineButton)
        lineButton.setImage(UIImage(named: "line.png"), for: .normal)
        lineButton.translatesAutoresizingMaskIntoConstraints = false
        lineButton.widthAnchor.constraint(equalTo: circleButton.widthAnchor).isActive = true
        lineButton.heightAnchor.constraint(equalTo: circleButton.heightAnchor).isActive = true
    }
    
    func configureTriangleButton() {
        stackView.addArrangedSubview(triangleButton)
        triangleButton.setImage(UIImage(named: "triangle.png"), for: .normal)
        triangleButton.translatesAutoresizingMaskIntoConstraints = false
        triangleButton.widthAnchor.constraint(equalTo: circleButton.widthAnchor).isActive = true
        triangleButton.heightAnchor.constraint(equalTo: circleButton.heightAnchor).isActive = true
    }
    
    func configurePenButton() {
        stackView.addArrangedSubview(penButton)
        penButton.setImage(UIImage(named: "pen.png"), for: .normal)
        penButton.translatesAutoresizingMaskIntoConstraints = false
        penButton.widthAnchor.constraint(equalTo: circleButton.widthAnchor).isActive = true
        penButton.heightAnchor.constraint(equalTo: circleButton.heightAnchor).isActive = true
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCell", for: indexPath) as! ColorCell
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    

}
