//
//  AddProfileView.swift
//  PizzaDiary
//
//  Created by David Chester on 11/10/22.
//

import UIKit

class AddProfileView: UIView {

    private var selectedRate: Int = 0

    // MARK: View Properties
    private lazy var profileHeroImage: UIImageView = {
        let phi = UIImageView()
        phi.image = UIImage(systemName: "camera.fill")
        phi.tintColor = .purple
        phi.contentMode = .scaleAspectFit

        phi.translatesAutoresizingMaskIntoConstraints = false
        return phi
    }()

    private lazy var nameField: UITextField = {
        let nf = CustomTextField()
     //   nf.backgroundColor = .blue
        nf.placeholder = "Name"

        return nf
    }()

    private lazy var addressField: UITextField = {
        let af = CustomTextField()
        af.placeholder = "Address"

        return af
    }()

     var starRatingStackView: UIStackView = {
        let srStackView = UIStackView()
        srStackView.axis = .horizontal
        srStackView.distribution = .fillEqually

         srStackView.isUserInteractionEnabled = true

        srStackView.translatesAutoresizingMaskIntoConstraints = false
        return srStackView
    }()

    @objc func applyRating(gesture: UITapGestureRecognizer){
        print("hi")
        let location = gesture.location(in: starRatingStackView)
        let starWidth = starRatingStackView.bounds.width / CGFloat(Constants.starsCount)

        let rate = Int(location.x / starWidth) + 1
        if rate != selectedRate {
           selectedRate = rate
        }

        starRatingStackView.arrangedSubviews.forEach { starView in
            guard let starImageView = starView as? UIImageView else {
                return
            }

            starImageView.isHighlighted = starImageView.tag <= rate
        }
    }


    // TODO: Fix Shadow
     var saveButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Save", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.layer.cornerRadius = 20
        button.layer.shadowRadius = 5
        button.layer.shadowColor = UIColor.black.cgColor
        button.backgroundColor = .black
        button.tintColor = .white
        button.addTarget(self, action: #selector(buttonTest), for: .touchUpInside)

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    @objc func buttonTest(){
        print("yooooo")
    }


    // MARK: - Init
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI Creation Methods
    private func createRatingStack(){
        for index in 1...Constants.starsCount {
            let star = createStars()
            star.tag = index
            starRatingStackView.addArrangedSubview(star)
        }
    }

    private func createStars() -> UIImageView {
        let starImages = UIImageView(image: UIImage(systemName: "star"), highlightedImage: UIImage(systemName: "star.fill"))

        starImages.contentMode = .scaleAspectFit
        starImages.isUserInteractionEnabled = true
        return starImages
    }


    // MARK: ConfigureUI Method
    private func configureUI() {
        createRatingStack()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(profileHeroImage)
        self.addSubview(nameField)
        self.addSubview(saveButton)
        self.addSubview(addressField)
        self.addSubview(starRatingStackView)

        let tapGestureOnStack = UITapGestureRecognizer(target: self, action: #selector(applyRating(gesture: )))
        starRatingStackView.addGestureRecognizer(tapGestureOnStack)

        NSLayoutConstraint.activate([
            profileHeroImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            profileHeroImage.heightAnchor.constraint(equalToConstant: 170),
            profileHeroImage.widthAnchor.constraint(equalTo: profileHeroImage.heightAnchor),
            profileHeroImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            nameField.topAnchor.constraint(equalTo: profileHeroImage.bottomAnchor, constant: 30),
            nameField.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1),
            nameField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            nameField.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            addressField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 10),
            addressField.widthAnchor.constraint(equalTo: nameField.widthAnchor),
            addressField.heightAnchor.constraint(equalTo: nameField.heightAnchor),
            addressField.centerXAnchor.constraint(equalTo: nameField.centerXAnchor),

            starRatingStackView.topAnchor.constraint(equalTo: addressField.bottomAnchor, constant: 20),
            starRatingStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            starRatingStackView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            starRatingStackView.heightAnchor.constraint(equalToConstant: 40),

            saveButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40),
            saveButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
            saveButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }


}


// MARK: - CustomTextField
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

struct Constants {
    static let starsCount = 5
}
