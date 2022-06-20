//
//  ViewController.swift
//  Places
//
//  Created by Olzhas Seiilkhanov on 20.06.2022.
//

import UIKit
import MapKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let mapView = MKMapView()
    let coordinate = CLLocationCoordinate2D(latitude: 40.728, longitude: -74)
    var myAnnotations = [MKPointAnnotation]()
    let bluredView = UIView()
    
    private var modeSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl (items: ["Standard","Satellite","Hybrid"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = .clear
        segmentedControl.addTarget(self, action: #selector(indexChanged(_:)), for: .valueChanged)
        return segmentedControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMapView()
        makeConstraints()
    }
    
    func makeConstraints() {
        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        mapView.addSubview(bluredView)
        bluredView.translatesAutoresizingMaskIntoConstraints = false
        bluredView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bluredView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        bluredView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        bluredView.heightAnchor.constraint(equalToConstant: 75).isActive = true
//        bluredView.backgroundColor = .clear
        
        view.sendSubviewToBack(mapView)
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = bluredView.bounds
        bluredView.addSubview(blurView)
        
        
        
//        bluredView.addSubview(modeSegmentedControl)
//        modeSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
//        modeSegmentedControl.centerYAnchor.constraint(equalTo: bluredView.centerYAnchor).isActive = true
//        modeSegmentedControl.centerXAnchor.constraint(equalTo: bluredView.centerXAnchor).isActive = true
//        modeSegmentedControl.backgroundColor = .clear
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
//        if modeSegmentedControl.selectedSegmentIndex == 0 {
//            print("0")
//        } else if modeSegmentedControl.selectedSegmentIndex == 1 {
//            print("1")
//        } else {
//            print("2")
//        }
    }
    
    @objc func createNewAnnotation(sender: UIGestureRecognizer) {
        if sender.state != UIGestureRecognizer.State.ended {
            
            print("Works!!!")
            
            let touchPoint = sender.location(in: mapView)
            let wayCoords = mapView.convert(touchPoint, toCoordinateFrom: mapView)
            let wayAnnotation = MKPointAnnotation()
            
            wayAnnotation.coordinate = wayCoords
            wayAnnotation.title = "waypoint"
            wayAnnotation.subtitle = "subtitle"
            
            myAnnotations.append(wayAnnotation)
            mapView.addAnnotations(myAnnotations)
        }
        
//        if sender.state != UIGestureRecognizer.State.began {
//            return
//        }
    }
    
}

extension ViewController: MKMapViewDelegate {
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        guard !(annotation is MKUserLocation) else { return nil }
//
//        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "custom")
//
//        if annotationView == nil {
//            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
//            annotationView?.canShowCallout = true
//        } else {
//            annotationView?.annotation = annotation
//        }
//
//        annotationView?.image = UIImage(named: "male")
//
//        return annotationView
//    }
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        guard annotation is MKPointAnnotation else { return nil }
//
//        let identifier = "Annotation"
//        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
//
//        if annotationView == nil {
//            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
//            annotationView!.canShowCallout = true
//        } else {
//            annotationView!.annotation = annotation
//        }
//
//        return annotationView
//    }
}
