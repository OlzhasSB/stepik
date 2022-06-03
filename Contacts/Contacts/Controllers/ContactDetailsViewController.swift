//
//  ContactDetailsViewController.swift
//  Contacts
//
//  Created by Olzhas Seiilkhanov on 03.06.2022.
//

import UIKit

class ContactDetailsViewController: UIViewController {

//    private var contactImageView = UIImageView()
//    private var contactNameLabel = UILabel()
//    private var contactNumberLabel = UILabel()
    
    
    var numberLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 80, width: UIScreen.main.bounds.width*0.9, height: 40))
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(numberLabel)
        
//        view.addSubview(contactNameLabel)
//        view.addSubview(contactImageView)
//        view.addSubview(contactNumberLabel)
//
//        configureImageView()
//        configureNameLabel()
//        configureNumberLabel()
    }
}
