//
//  ViewController.swift
//  PaintApp
//
//  Created by Olzhas Seiilkhanov on 14.06.2022.
//

import UIKit

class ViewController: UIViewController {

    var colors: [UIColor] = [.blue, .purple, .red, .green, .yellow, .brown, .gray]
    
    var circleButton = UIButton()
    var triangleButton = UIButton()
    var lineButton = UIButton()
    var rectangleButton = UIButton()
    var penButton = UIButton()
    var fillLabel = UILabel()
    var fillSwitch = UISwitch()
    var undoButton = UIButton()
    
    var stackView: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .white
        stack.axis = .horizontal
        stack.distribution = .equalCentering
        stack.alignment = .center
        stack.spacing = 20
        return stack
    }()

    var colorsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 25, height: 40)
        layout.minimumLineSpacing = 1
    
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(ColorCell.self, forCellWithReuseIdentifier: ColorCell.identifier)
        return collection
    }()
    
    var canvasView = CanvasView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureStackView()
        configureCanvasView()
    }
    
    @objc func undoButtonTapped() {
        canvasView.undoDraw()
    }
    
    @objc func longPress(gesture: UILongPressGestureRecognizer) {
        canvasView.clearCanvasView()
    }
    
    @objc func lineButtonTapped() {
        canvasView.method = "line"
    }
    
    @objc func penButtonTapped() {
        canvasView.method = "pen"
    }
    
    func configureCanvasView() {
        view.addSubview(canvasView)
        canvasView.backgroundColor = UIColor(named: "background")
        canvasView.translatesAutoresizingMaskIntoConstraints = false
        canvasView.topAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
        canvasView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        canvasView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        canvasView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func configureStackView() {
        view.addSubview(stackView)
        setStackViewConstraints()
        
        configureCircleButton()
        configureRectangleButton()
        configureLineButton()
        configureTriangleButton()
        configurePenButton()
        configureFillLabel()
        stackView.addArrangedSubview(fillSwitch)
        configureColorsCollectionView()
        configureUndoButton()
    }
    
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func configureColorsCollectionView() {
        colorsCollectionView.dataSource = self
        colorsCollectionView.delegate = self
        
        colorsCollectionView.isScrollEnabled = false
        stackView.addArrangedSubview(colorsCollectionView)
        
        colorsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        colorsCollectionView.widthAnchor.constraint(equalToConstant: 180).isActive = true
        colorsCollectionView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func configureFillLabel() {
        stackView.addArrangedSubview(fillLabel)
        fillLabel.text = "Fill"
    }
    
    func configureCircleButton() {
        stackView.addArrangedSubview(circleButton)
        circleButton.setImage(UIImage(named: "circle.png"), for: .normal)
        circleButton.translatesAutoresizingMaskIntoConstraints = false
        circleButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        circleButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        circleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
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
        
        lineButton.addTarget(self, action: #selector(lineButtonTapped), for: .touchUpInside)
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
        
        penButton.addTarget(self, action: #selector(penButtonTapped), for: .touchUpInside)
    }
    
    func configureUndoButton() {
        stackView.addArrangedSubview(undoButton)
        undoButton.setImage(UIImage(named: "undo.png"), for: .normal)
        undoButton.translatesAutoresizingMaskIntoConstraints = false
        undoButton.widthAnchor.constraint(equalTo: circleButton.widthAnchor).isActive = true
        undoButton.heightAnchor.constraint(equalTo: circleButton.heightAnchor).isActive = true
        undoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        undoButton.addTarget(self, action: #selector(undoButtonTapped), for: .touchUpInside)
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(self.longPress(gesture:)))
        longPress.minimumPressDuration = 0.5
        undoButton.addGestureRecognizer(longPress)
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorCell.identifier, for: indexPath)
        cell.contentView.backgroundColor = colors[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        canvasView.strokeColor = colors[indexPath.row]
    }
}
