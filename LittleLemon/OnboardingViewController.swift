//
//  OnboardingViewController.swift
//  LittleLemon
//
//  Created by Bianca Curutan on 9/24/24.
//

import UIKit

class OnboardingViewController: UIViewController {
    var kFirstName = "FirstName"
    var kLastName = "LastName"
    var kEmail = "Email"

    var firstNameField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .lightGray
        textField.placeholder = "First Name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return textField
    }()

    var lastNameField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .lightGray
        textField.placeholder = "Last Name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return textField
    }()

    var emailField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .lightGray
        textField.placeholder = "Email"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return textField
    }()

    var registerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Register", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false

        stackView.addArrangedSubview(firstNameField)
        stackView.addArrangedSubview(lastNameField)
        stackView.addArrangedSubview(emailField)

        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            view.safeAreaLayoutGuide.rightAnchor.constraint(equalTo: stackView.rightAnchor, constant: 24)
        ])

        view.addSubview(registerButton)
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 24),
            registerButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(greaterThanOrEqualTo: registerButton.bottomAnchor),
            view.safeAreaLayoutGuide.rightAnchor.constraint(equalTo: registerButton.rightAnchor, constant: 24)
        ])
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)

        UserDefaults.standard.set(firstNameField.text, forKey: kFirstName)
        UserDefaults.standard.set(lastNameField.text, forKey: kLastName)
        UserDefaults.standard.set(emailField.text, forKey: kEmail)
    }

    @objc private func registerButtonTapped() {
        if let firstName = firstNameField.text, !firstName.isEmpty,
           let lastName = lastNameField.text, !lastName.isEmpty,
           let email = emailField.text, !email.isEmpty {
            navigationController?.pushViewController(HomeViewController(), animated: true)

        } else {
            let alert = UIAlertController(title: nil, message: "Please fill in all fields", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
}
