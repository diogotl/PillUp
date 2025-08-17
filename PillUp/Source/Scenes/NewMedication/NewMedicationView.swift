//
//  NewMedicationView.swift
//  PillUp
//
//  Created by Diogo on 17/08/2025.
//

import Foundation
import UIKit

class NewMedicationView: UIView{
    
    
    let pageLabel: UILabel = {
        let label = UILabel()
        label.text = "New Medication"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let pageDescription: UILabel = {
        let label = UILabel()
        label.text = "Add a new medication to your list"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let remedy = Input(
        labelText: "Medication Name",
        placeholder: "Medication Name",
    )
    
    
    let time = Input(
        labelText: "Time",
        placeholder: "Time",
    )
    
    let frequency = Input(
        labelText: "Frequency",
        placeholder: "Frequency",
    )
    
    let takeNowCheckBox = CheckBox()
        
    let takeNowLabel: UILabel = {
        let label = UILabel()
        label.text = "Take Now"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Submit", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = UIColor.systemRed
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .white
        addSubview(pageLabel)
        addSubview(pageDescription)
        addSubview(remedy)
        addSubview(time)
        addSubview(frequency)
        addSubview(takeNowCheckBox)
        addSubview(takeNowLabel)
        addSubview(submitButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            pageLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            pageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            pageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            pageDescription.topAnchor.constraint(equalTo: pageLabel.bottomAnchor, constant: 10),
            pageDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            pageDescription.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            remedy.topAnchor.constraint(equalTo: pageDescription.bottomAnchor, constant: 20),
            remedy.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            remedy.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            time.topAnchor.constraint(equalTo: remedy.bottomAnchor, constant: 40),
            time.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            time.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            frequency.leadingAnchor.constraint(equalTo: time.leadingAnchor),
            frequency.topAnchor.constraint(equalTo: time.bottomAnchor, constant: 40),
            frequency.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            takeNowCheckBox.topAnchor.constraint(equalTo: frequency.bottomAnchor, constant: 20),
            takeNowCheckBox.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            takeNowLabel.leadingAnchor.constraint(equalTo: takeNowCheckBox.trailingAnchor, constant: 10),
            takeNowLabel.centerYAnchor.constraint(equalTo: takeNowCheckBox.centerYAnchor),
            
            submitButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            submitButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            submitButton.heightAnchor.constraint(equalToConstant: 44),
            submitButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
        
    }
    
}
