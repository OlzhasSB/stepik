//
//  AddContactViewController.swift
//  Contacts
//
//  Created by Olzhas Seiilkhanov on 04.06.2022.
//

import UIKit

protocol AddContactDelegate {
    func addContact(contact: Contact)
}

class AddContactViewController: UIViewController {
    
    var delegate: AddContactDelegate?
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Full Name"
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let numberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Number"
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDone))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))

        configureNameTextField()
        configureNumberTextField()
    }
    
    @objc func handleDone() {
        guard let fullname = nameTextField.text, nameTextField.hasText else { return }
        guard let number = numberTextField.text, numberTextField.hasText else { return }
        let contact = Contact(name: fullname, number: number, photo: UIImage(named: "avengers.jpeg"))
        delegate?.addContact(contact: contact)
    }
    
    @objc func handleCancel() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Constraiints
    
    func configureNameTextField() {
        view.addSubview(nameTextField)
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        nameTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 64).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nameTextField.textAlignment = .left
        
        nameTextField.layer.borderWidth = 2
        nameTextField.layer.cornerRadius = 5
        nameTextField.layer.borderColor = UIColor.systemGray5.cgColor
        nameTextField.setLeftPaddingPoints(10)
   
        nameTextField.becomeFirstResponder()
    }
    
    func configureNumberTextField() {
        view.addSubview(numberTextField)
        numberTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        numberTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 170).isActive = true
        numberTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 64).isActive = true
        numberTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        numberTextField.textAlignment = .left
        
        numberTextField.layer.borderWidth = 2
        numberTextField.layer.cornerRadius = 5
        numberTextField.layer.borderColor = UIColor.systemGray5.cgColor
        numberTextField.setLeftPaddingPoints(10)
   
        numberTextField.becomeFirstResponder()
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
