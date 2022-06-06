//
//  AddContactViewController.swift
//  Contacts
//
//  Created by Olzhas Seiilkhanov on 04.06.2022.
//

import UIKit

protocol AddContactDelegate: AnyObject {
    func addContact(contact: Contact)
}

class AddContactViewController: UIViewController {
    
    weak var delegate: AddContactDelegate?
    
    private let genders: [String] = ["male", "female"]
    private var selectedGender: String = ""
    
    private let picker = UIPickerView()
    private let saveButton = UIButton()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Full Name"
        textField.textAlignment = .center
        return textField
    }()
    
    private let numberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Number"
        textField.textAlignment = .center
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "New Contact"
        selectedGender = genders[0]

        configureNameTextField()
        configureNumberTextField()
        configurePickerView()
        configureSaveButton()
    }
    
    @objc func saveButtonTapped() {
        guard let fullname = nameTextField.text, nameTextField.hasText else { return }
        guard let number = numberTextField.text, numberTextField.hasText else { return }
        
        let contact = Contact(name: fullname, number: number, photo: UIImage(named: selectedGender + ".png"), gender: selectedGender)
        
        delegate?.addContact(contact: contact)
        self.navigationController?.popViewController(animated: true)
    }
    
// MARK: - Configure UI Elements
    
    private func configurePickerView() {
        picker.delegate = self
        picker.dataSource = self
        
        view.addSubview(picker)
        
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        picker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        picker.topAnchor.constraint(equalTo: numberTextField.bottomAnchor).isActive = true
    }
    
    private func configureNameTextField() {
        view.addSubview(nameTextField)
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
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
        nameTextField.clearButtonMode = .whileEditing
    }
    
    private func configureNumberTextField() {
        numberTextField.delegate = self
        
        view.addSubview(numberTextField)
        
        numberTextField.translatesAutoresizingMaskIntoConstraints = false
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
        numberTextField.clearButtonMode = .whileEditing
    }
    
    private func configureSaveButton() {
        view.addSubview(saveButton)
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
        saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        saveButton.backgroundColor = .systemBlue
        saveButton.setTitle("Save", for: .normal)
        saveButton.titleLabel?.textColor = .white
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
}

// MARK: - TextField Padding

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}

// MARK: - PickerView Protocols

extension AddContactViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genders.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genders[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedGender = genders[row]
    }
}

extension AddContactViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}
