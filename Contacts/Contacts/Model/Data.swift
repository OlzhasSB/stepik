//
//  Data.swift
//  Contacts
//
//  Created by Olzhas Seiilkhanov on 04.06.2022.
//

import UIKit

struct Data {
    var contacts: [Contact] = [
        Contact.init(name: "Nursultan Nazarbayev", number: "87075427773", photo: UIImage(named: "male.png"), gender: "male"),
        Contact.init(name: "Vasya Pupkin", number: "87772377707", photo: UIImage(named: "female.png"), gender: "female"),
        Contact.init(name: "Vladimir Putin", number: "87714237477", photo: UIImage(named: "male.png"), gender: "male")
    ]
}
