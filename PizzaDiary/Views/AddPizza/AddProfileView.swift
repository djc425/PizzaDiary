//
//  AddProfileView.swift
//  PizzaDiary
//
//  Created by David Chester on 11/10/22.
//

import UIKit

class AddProfileView: UIView {

    private var profileHeroImage: UIImageView = {
        let phi = UIImageView()
        phi.image = UIImage(systemName: "camera.fill")
        phi.tintColor = .purple
        phi.contentMode = .scaleAspectFit

        phi.translatesAutoresizingMaskIntoConstraints = false
        return phi
    }()

    private var nameField: UITextField = {
        let nf = CustomTextField()
     //   nf.backgroundColor = .blue
        nf.placeholder = "Name"

        return nf
    }()

    private var addressField: UITextField = {
        let af = CustomTextField()
        af.placeholder = "Address"

        return af
    }()

    // TODO: Fix Shadow
    private var saveButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Save", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.layer.cornerRadius = 20
        button.layer.shadowRadius = 5
        button.layer.shadowColor = UIColor.black.cgColor
        button.backgroundColor = .black
        button.tintColor = .white

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()




    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(profileHeroImage)
        self.addSubview(nameField)
        self.addSubview(saveButton)
        self.addSubview(addressField)

        NSLayoutConstraint.activate([
            profileHeroImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            profileHeroImage.heightAnchor.constraint(equalToConstant: 170),
            profileHeroImage.widthAnchor.constraint(equalTo: profileHeroImage.heightAnchor),
            profileHeroImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            nameField.topAnchor.constraint(equalTo: profileHeroImage.bottomAnchor, constant: 30),
            nameField.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1),
            nameField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),

            addressField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 10),
            addressField.widthAnchor.constraint(equalTo: nameField.widthAnchor),
            addressField.heightAnchor.constraint(equalTo: nameField.heightAnchor),


            saveButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40),
            saveButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
            saveButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }


}


// TODO: Custom textfield for the various properties


final class CustomTextField: UITextField {
    var padding = UIEdgeInsets(top: 20/UIScreen.main.scale, left: 10, bottom: 20/UIScreen.main.scale, right: 10)

    init(padding: UIEdgeInsets = UIEdgeInsets(top: 20/UIScreen.main.scale, left: 10, bottom: 20/UIScreen.main.scale, right: 10), frame: CGRect = .zero) {
        super.init(frame: frame)
        self.padding = padding
        self.backgroundColor = .purple
        self.textAlignment = .left
        self.returnKeyType = .next
        self.autocorrectionType = .no
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 20
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: padding)
    }

}
