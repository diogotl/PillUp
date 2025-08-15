//
//  LoginBottomSheetView.swift
//  PillUp
//
//  Created by Diogo on 15/08/2025.
//

import Foundation
import UIKit

class LoginBottomSheetView: UIView {
    
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
        label.text = "Login"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email"
        textField.layer.borderWidth = Spacing.tiny
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = Spacing.tiny
        textField.font = Typography.input
        textField.textColor = .black
        
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email"
        textField.layer.borderWidth = Spacing.tiny
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = Spacing.tiny
        textField.font = Typography.input
        textField.isSecureTextEntry = true
        textField.textColor = .black
        return textField
    }()
    
    let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.backgroundColor = UIColor.systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = Spacing.tiny
        button.titleLabel?.font = Typography.subHeading
        return button
    }()
    
    private func setupUI(){
        self.backgroundColor = .white
        self.addSubview(handleArea)
        self.addSubview(titleLabel)
        self.addSubview(emailTextField)
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
            
            emailTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Spacing.medium),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Spacing.medium),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Spacing.medium),
            
            emailTextField.heightAnchor.constraint(equalToConstant: 44),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Spacing.small),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Spacing.medium),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Spacing.medium),
            passwordTextField.heightAnchor.constraint(equalToConstant: 44),
            
            submitButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: Spacing.medium),
            submitButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Spacing.medium),
            submitButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Spacing.medium),
            submitButton.heightAnchor.constraint(equalToConstant: 44),
                                                     
                                                    
        ])
    }
        
}
