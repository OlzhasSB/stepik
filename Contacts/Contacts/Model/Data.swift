//
//  Data.swift
//  Contacts
//
//  Created by Olzhas Seiilkhanov on 04.06.2022.
//

import UIKit

struct Data {
    var contacts: [Contact] = [
        Contact.init(name: "Name Surname", number: "number", photo: UIImage(named: "avengers.jpeg")),
        Contact.init(name: "Name Surname", number: "number", photo: UIImage(named: "sonic.jpeg")),
        Contact.init(name: "Name Surname", number: "number", photo: UIImage(named: "avengers.jpeg"))
    ]
}
