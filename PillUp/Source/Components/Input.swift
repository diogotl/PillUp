//
//  Input.swift
//  PillUp
//
//  Created by Diogo on 17/08/2025.
//

import Foundation
import UIKit

class Input: UIView {
    
    
    let label: UILabel = {
        let label = UILabel()
        label.font = Typography.label
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let input: UITextField = {
        let textField = UITextField()
        textField.font = Typography.input
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = Spacing.small
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    init(
        labelText: String,
        placeholder: String?
    ) {
        super.init(frame: .zero)
        label.text = labelText
        input.placeholder = placeholder
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(label)
        addSubview(input)
        setupConstraints()
    }
    
    private func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            input.topAnchor.constraint(equalTo: label.bottomAnchor, constant: Spacing.tiny),
            input.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            input.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            input.heightAnchor.constraint(equalToConstant: 44),
            
            input.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    
}

