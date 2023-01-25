//
//  AddPizzaViewController.swift
//  PizzaDiary
//
//  Created by David Chester on 11/10/22.
//

import UIKit

class AddPizzaViewController: UIViewController {

    let addProfileView = AddProfileView()

    var activeTextField: UITextField? = nil

    var coreDataMethods = CoreDataMethods()

    var loadedPizzaPlaces = [PizzaPlace]()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "New Profile"
        // Do any additional setup after loading the view.

        addProfileView.saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)

        addProfileView.nameField.delegate = self
        addProfileView.addressField.delegate = self


        // Notification Observers for when Keyboard will show and hide
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)


    }

    @objc func saveButtonPressed(){
        print("saved press")

    }

    @objc func keyboardWillShow(notification: NSNotification){
        // if the keyboard isn't available we ignore
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }

        var shouldMoveUp = false

        // make sure the active textfield is not nil
        if let activeTextField = activeTextField {
            let bottomOfTextField = activeTextField.convert(activeTextField.bounds, to: self.view).maxY;
            let topOfKeyboard = self.view.frame.height - keyboardSize.height

            if bottomOfTextField > topOfKeyboard {
                shouldMoveUp = true
            }
        }

        if (shouldMoveUp) {
            self.view.frame.origin.y = 0 - keyboardSize.height
        }

    }

    @objc func keyboardWillHide(notification: NSNotification){
        self.view.frame.origin.y = 0
    }

}

extension AddPizzaViewController: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // remove new lines should they be added
        textField.text = textField.text?.trimmingCharacters(in: .newlines)

        switch textField {
        case addProfileView.nameField :
            addProfileView.addressField.becomeFirstResponder()
        case addProfileView.addressField :
            textField.resignFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return false

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) // resigns keyboard when users touches outside of textfield
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
    }
    
}

// MARK: - Validation Alert
extension AddPizzaViewController {
     func profileMissingInformationAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alert, animated: true)
    }
}

extension AddPizzaViewController {
    override func loadView() {
        view = UIView()
        view.backgroundColor = .systemOrange
        view.addSubview(addProfileView)

       // addProfileView.starRatingStackView.addGestureRecognizer(tapGestureOnStack)
        //addProfileView.saveButton.addTarget(self, action: #selector(buttonTest), for: .touchUpInside)

        NSLayoutConstraint.activate([
            addProfileView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            addProfileView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            addProfileView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            addProfileView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),

        ])
    }
}
