//
//  EditContactViewController.swift
//  Contacts
//
//  Created by Olzhas Seiilkhanov on 05.06.2022.
//

import UIKit

protocol EditContactDelegate {
    func editContact(contact: Contact, index: IndexPath)
}

class EditContactViewController: UIViewController {

    var delegate: EditContactDelegate?
    var index: IndexPath!
    var selectedGender: String?
    
    let genders: [String] = ["male", "female"]
    var currentName: String?
    var currentNumber: String?
    var currentGender: String? {
        didSet {
            if currentGender == "male" {
                genderIndex = 0
            } else {
                genderIndex = 1
            }
        }
    }
    var genderIndex: Int?
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let numberTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let picker = UIPickerView()
    let saveButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDone))
        
        configureNameTextField()
        configureNumberTextField()
        configurePickerView()
        configureSaveButton()
        
        preselect()
    }
    
    @objc func handleCancel() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handleDone() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func saveButtonTapped() {
        guard let fullname = nameTextField.text, nameTextField.hasText else { return }
        guard let number = numberTextField.text, numberTextField.hasText else { return }
        
        let contact = Contact(name: fullname, number: number, photo: UIImage(named: "male.png"), gender: selectedGender)
        
        delegate?.editContact(contact: contact, index: index)
        
        navigationController?.popViewController(animated: true)
        
        
//        let contact = Contact(name: fullname, number: number, photo: UIImage(named: selectedGender + ".png"), gender: selectedGender)
//        delegate?.addContact(contact: contact)
    }
    
    func preselect() {
        nameTextField.text = currentName
        numberTextField.text = currentNumber
        picker.selectRow(genderIndex ?? 0, inComponent: 0, animated: true)
    }
    
    // MARK: - Configuration
    
    func configurePickerView() {
        self.picker.delegate = self
        self.picker.dataSource = self
        view.addSubview(picker)
        picker.translatesAutoresizingMaskIntoConstraints = false

        picker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        picker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        picker.topAnchor.constraint(equalTo: numberTextField.bottomAnchor).isActive = true
    }
    
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
        nameTextField.clearButtonMode = .whileEditing
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
        numberTextField.clearButtonMode = .whileEditing
        numberTextField.delegate = self
    }
    
    func configureSaveButton() {
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

extension EditContactViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
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

extension EditContactViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}
