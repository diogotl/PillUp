//
//  LoginBottomSheetView.swift
//  PillUp
//
//  Created by Diogo on 15/08/2025.
//

import Foundation
import UIKit

class LoginBottomSheetView: UIView {
    
    weak var delegate: LoginBottomSheetViewDelegate?
    
    init () {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let handleArea: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = Spacing.tiny
        view.layer.masksToBounds = true
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //localizable
        label.text = NSLocalizedString("login.title", comment: "Login Title")
        label.font = Typography.heading
        label.textColor = .black
        return label
    }()
    
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email"
        label.font = Typography.label
        label.textColor = .black
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = Spacing.small
        textField.font = Typography.input
        textField.textColor = .black
        
        return textField
    }()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Password"
        label.font = Typography.label
        label.textColor = .black
        return label
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = Spacing.small
        textField.font = Typography.input
        textField.isSecureTextEntry = true
        textField.textColor = .black
        return textField
    }()
    
    let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.backgroundColor = Colors.primaryRedBase
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = Spacing.medium
        button.titleLabel?.font = Typography.label
        button.addTarget(self, action: #selector(submitButtonTapped), for:.touchUpInside)
        return button
    }()
    
    @objc
    private func submitButtonTapped() {
        
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        delegate?.handleLoginButtonTapped(email: email, password: password)
    }
        
    
    private func setupUI(){
        
        self.backgroundColor = .white
        self.layer.cornerRadius = Spacing.medium
        self.layer.masksToBounds = true

        self.addSubview(handleArea)
        self.addSubview(titleLabel)
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextField)
        self.addSubview(submitButton)
        
        setupConstraints()
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            handleArea.topAnchor.constraint(equalTo: self.topAnchor, constant: Spacing.small),
            handleArea.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            handleArea.widthAnchor.constraint(equalToConstant: 50),
            handleArea.heightAnchor.constraint(equalToConstant: 5),
            
            titleLabel.topAnchor.constraint(equalTo: handleArea.bottomAnchor, constant: Spacing.small),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Spacing.medium),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Spacing.medium),
            
            emailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Spacing.medium),
            emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Spacing.medium),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: Spacing.medium),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Spacing.medium),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Spacing.medium),
            emailTextField.heightAnchor.constraint(equalToConstant: 48),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Spacing.medium),
            passwordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Spacing.medium),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: Spacing.small),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Spacing.medium),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Spacing.medium),
            passwordTextField.heightAnchor.constraint(equalToConstant: 48),
            
            submitButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: Spacing.medium),
            submitButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Spacing.medium),
            submitButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Spacing.medium),
            submitButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -Spacing.medium),
            submitButton.heightAnchor.constraint(equalToConstant: 48),
                                                     
                                                    
        ])
    }
        
}
