//
//  Data.swift
//  Contacts
//
//  Created by Olzhas Seiilkhanov on 04.06.2022.
//

import UIKit

struct Data {
    var contacts: [Contact] = [
        Contact.init(name: "Name Surname", number: "87777777777", photo: UIImage(named: "male.png"), gender: "male"),
        Contact.init(name: "Name Surname", number: "87777777777", photo: UIImage(named: "female.png"), gender: "female"),
        Contact.init(name: "Name Surname", number: "87777777777", photo: UIImage(named: "male.png"), gender: "male")
    ]
}
