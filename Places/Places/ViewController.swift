//
//  ViewController.swift
//  Places
//
//  Created by Olzhas Seiilkhanov on 20.06.2022.
//

import UIKit
import MapKit

protocol EditLocationDelegate: AnyObject {
    func editLocation(title: String, subtitle: String)
}

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    private let mapView = MKMapView()
    private let pinsTableView: UITableView = {
        let tableView = UITableView()
        tableView.isHidden = true
        tableView.register(PinCell.self, forCellReuseIdentifier: "pinCell")
        return tableView
    }()
    private let modeSegmentedControl = UISegmentedControl (items: ["Standard","Satellite","Hybrid"])
    private let leftButton = UIButton()
    private let rightButton = UIButton()
    
    private var selectedLocation: MKAnnotation?
    private var myAnnotations = [MKPointAnnotation]()
    private var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureMapView()
        configureTableView()
        configureSegmentedControl()
        makeConstraints()
    }

    private func configureView() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(showSavedPins))
        navigationController?.view.backgroundColor = .white
    }
    
    private func configureSegmentedControl() {
        modeSegmentedControl.selectedSegmentIndex = 0
        modeSegmentedControl.backgroundColor = .clear
        modeSegmentedControl.addTarget(self, action: #selector(indexChanged(_:)), for: .valueChanged)
    }
    
    private func configureTableView() {
        pinsTableView.isHidden = true
        pinsTableView.dataSource = self
        pinsTableView.delegate = self
        pinsTableView.register(PinCell.self, forCellReuseIdentifier: "pinCell")
    }
    
    private func configureMapView() {
        mapView.delegate = self
        addLongPressGesture()
    }
    
    private func addLongPressGesture() {
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(self.createNewAnnotation(sender:)))
        longPress.minimumPressDuration = 0.5
        mapView.addGestureRecognizer(longPress)
    }
    
    private func makeConstraints() {
        view.addSubview(pinsTableView)
        pinsTableView.makeConstraints(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor)
        
        view.addSubview(mapView)
        mapView.makeConstraints(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor)
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        
        view.addSubview(blurView)
        blurView.makeConstraints(leading: view.safeAreaLayoutGuide.leadingAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, bottom: view.bottomAnchor, height: 100)
        
        view.addSubview(modeSegmentedControl)
        modeSegmentedControl.makeConstraints(bottom: view.safeAreaLayoutGuide.bottomAnchor)
        modeSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        blurView.contentView.addSubview(leftButton)
        leftButton.makeConstraints(top: blurView.topAnchor, leading: blurView.leadingAnchor, trailing: modeSegmentedControl.leadingAnchor, bottom: blurView.bottomAnchor)
        leftButton.addTarget(self, action: #selector(switchButtonPressed), for: .touchUpInside)
        
        blurView.contentView.addSubview(rightButton)
        rightButton.makeConstraints(top: blurView.topAnchor, leading: modeSegmentedControl.trailingAnchor, trailing: blurView.trailingAnchor, bottom: blurView.bottomAnchor)
        rightButton.addTarget(self, action: #selector(switchButtonPressed), for: .touchUpInside)
        rightButton.tag = 1
    }

    @objc private func switchButtonPressed(_ sender: UIButton) {
        if index < 0 {
            index = 0
        } else if index >= myAnnotations.count {
            index = myAnnotations.count - 1
        }
        
        mapView.setRegion(MKCoordinateRegion(center: myAnnotations[index].coordinate, span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)), animated: false)

        switch sender.tag {
        case 0:
            index -= 1
        case 1:
            index += 1
        default: break
        }
        
    }
    
    @objc private func showSavedPins() {
        view.sendSubviewToBack(mapView)
        pinsTableView.isHidden.toggle()
    }
    
    @objc private func indexChanged(_ sender: UISegmentedControl) {
        if modeSegmentedControl.selectedSegmentIndex == 0 {
            mapView.mapType = .standard
        } else if modeSegmentedControl.selectedSegmentIndex == 1 {
            mapView.mapType = .satellite
        } else {
            mapView.mapType = .hybrid
        }
    }
    
    @objc private func createNewAnnotation(sender: UIGestureRecognizer) {
        if sender.state != UIGestureRecognizer.State.ended {
            let touchPoint = sender.location(in: mapView)
            let wayCoords = mapView.convert(touchPoint, toCoordinateFrom: mapView)
            let wayAnnotation = MKPointAnnotation()
            wayAnnotation.coordinate = wayCoords
            
            let alert = UIAlertController(title: "Add Place", message: "Fill all the fields", preferredStyle: .alert)
            alert.addTextField { (textField: UITextField) in
                textField.placeholder = "Enter title"
            }
            alert.addTextField { (textField: UITextField) in
                textField.placeholder = "Enter subtitle"
            }
            
            alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { [self] (action: UIAlertAction) in
                guard let title = alert.textFields?.first else { return }
                guard let subtitle = alert.textFields?[1] else { return }
                
                wayAnnotation.title = title.text
                wayAnnotation.subtitle = subtitle.text
                
                myAnnotations.append(wayAnnotation)
                mapView.addAnnotations(myAnnotations)
                pinsTableView.reloadData()
            }))
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
        if sender.state != UIGestureRecognizer.State.began { return }
    }
    
    @objc private func infoButtonTapped() {
        let editVC = EditViewController()
        editVC.location = selectedLocation
        editVC.delegate = self
        navigationController?.pushViewController(editVC, animated: true)
    }
    
}

// MARK: - MapView delegates
extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation { return nil }
        
        let reuseId = "pin"
        
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            pinView!.animatesDrop = true
            let calloutButton = UIButton(type: .detailDisclosure)
            calloutButton.addTarget(self, action: #selector(infoButtonTapped), for: .touchUpInside)
            pinView!.rightCalloutAccessoryView = calloutButton
            pinView!.sizeToFit()
        }
        else {
            pinView!.annotation = annotation
        }
        return pinView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let location = view.annotation else { return }
        selectedLocation = location
    }
}

// MARK: - TableView delegates
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myAnnotations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pinCell") as! PinCell
        cell.textLabel!.text = myAnnotations[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        view.sendSubviewToBack(pinsTableView)
        mapView.setRegion(MKCoordinateRegion(center: myAnnotations[indexPath.row].coordinate, span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)), animated: false)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            mapView.removeAnnotation(myAnnotations[indexPath.row])
            myAnnotations.remove(at: indexPath.row)
            pinsTableView.deleteRows(at: [indexPath], with: .fade)
            pinsTableView.reloadData()
        }
    }
    
}

// MARK: - EditLocation delegate
extension ViewController: EditLocationDelegate {
    
    func editLocation(title: String, subtitle: String) {
        if let index = myAnnotations.firstIndex(of: selectedLocation as! MKPointAnnotation) {
            myAnnotations[index].title = title
            mapView.removeAnnotation(myAnnotations[index])
            mapView.addAnnotation(myAnnotations[index])
            pinsTableView.reloadData()
        }
    }
    
}
