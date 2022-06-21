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

class ViewController: UIViewController, UIGestureRecognizerDelegate, EditLocationDelegate {
    
    var selectedLocation: MKAnnotation?
    
    let mapView = MKMapView()
    let bluredView = UIView()
    let pinsTableView = UITableView()
    private var modeSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl (items: ["Standard","Satellite","Hybrid"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = .clear
        segmentedControl.addTarget(self, action: #selector(indexChanged(_:)), for: .valueChanged)
        return segmentedControl
    }()
    
    let coordinate = CLLocationCoordinate2D(latitude: 40.728, longitude: -74)
    var myAnnotations = [MKPointAnnotation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMapView()
        configureTableView()
        makeConstraints()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(showSavedPins))
        navigationController?.view.backgroundColor = .white
    }
    
    @objc private func showSavedPins() {
        view.sendSubviewToBack(mapView)
        pinsTableView.isHidden.toggle()
    }
    
    func editLocation(title: String, subtitle: String) {
//        if let index = myAnnotations.firstIndex(of: selectedLocation as! MKPointAnnotation) {
//            print(index)
//            myAnnotations[index].title = title
//            mapView.removeAnnotation(myAnnotations[index])
//            mapView.addAnnotation(myAnnotations[index])
//        }
    }
    
    func configureTableView() {
        view.addSubview(pinsTableView)
        pinsTableView.isHidden = true
        pinsTableView.dataSource = self
        pinsTableView.delegate = self
        pinsTableView.register(PinCell.self, forCellReuseIdentifier: "pinCell")
        
        pinsTableView.translatesAutoresizingMaskIntoConstraints = false
        pinsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        pinsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        pinsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        pinsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func makeConstraints() {
        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        view.addSubview(bluredView)
        bluredView.translatesAutoresizingMaskIntoConstraints = false
        bluredView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bluredView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        bluredView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        bluredView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = CGRect(x: 0, y: 800, width: 420, height: 100)
        view.addSubview(blurView)
        
        view.addSubview(modeSegmentedControl)
        modeSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        modeSegmentedControl.centerYAnchor.constraint(equalTo: bluredView.centerYAnchor).isActive = true
        modeSegmentedControl.centerXAnchor.constraint(equalTo: bluredView.centerXAnchor).isActive = true
    }
    
    func configureMapView() {
        mapView.delegate = self
        addLongPressGesture()
    }
    
    func addLongPressGesture() {
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(self.createNewAnnotation(sender:)))
        longPress.minimumPressDuration = 0.5
        mapView.addGestureRecognizer(longPress)
    }
    
    @objc func indexChanged(_ sender: UISegmentedControl) {
        if modeSegmentedControl.selectedSegmentIndex == 0 {
            mapView.mapType = .standard
        } else if modeSegmentedControl.selectedSegmentIndex == 1 {
            mapView.mapType = .satellite
        } else {
            mapView.mapType = .hybrid
        }
    }
    
    @objc func createNewAnnotation(sender: UIGestureRecognizer) {
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
//        if sender.state != UIGestureRecognizer.State.began { return }
    }
    
    @objc func infoButtonTapped() {
        let editVC = EditViewController()
        editVC.location = selectedLocation
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
