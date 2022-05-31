//
//  CastMemberViewController.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 24.05.2022.
//

import UIKit

class CastMemberViewController: UIViewController {
    @IBOutlet private var castImageView: UIImageView!
    @IBOutlet private var castNameLabel: UILabel!
    @IBOutlet private var castBirthdayLabel: UILabel!
    @IBOutlet private var castDepartmentLabel: UILabel!
    @IBOutlet private var castBiographyLabel: UILabel!
    
    var castImage: UIImage!
    var castName: String!
    var castBirthday: String!
    var castDepartment: String!
    var castBiography: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        assign()
    }
    
//    private func assign() {
//        castImageView.image = castImage
//        castNameLabel.text = castName
//        castBirthdayLabel.text = castBirthday
//        castDepartmentLabel.text = castDepartment
//        castBiographyLabel.text = castBiography
//    }
}
