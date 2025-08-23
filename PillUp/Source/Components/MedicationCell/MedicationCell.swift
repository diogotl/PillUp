//
//  MedicationCell.swift
//  PillUp
//
//  Created by Diogo on 19/08/2025.
//

import UIKit

class MedicationCell: UITableViewCell {
    
    static let identifier = "MedicationCell"
    
    weak var delegate: MedicationCellDelegate?
    
    var medication: Medication!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let remedyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let removeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(
            UIImage(systemName: "trash"),
            for: .normal)
        button.tintColor = Colors.secondaryRedBase
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc
    private func removeButtonTapped() {
        print("Remove button tapped for medication with ID: \(medication.id)")

        delegate?.handleRemoveMedicationButtonTapped(
            id: medication.id
        )
    }
    
    
    let time = Badge(
        icon: "clock",
        labelText: "Time",
    )
    
    let frequency = Badge(
        icon: "repeat",
        labelText: "Frequency",
    )
    
    private func setupUI() {
        backgroundColor = Colors.gray500
        layer.cornerRadius = Spacing.small
        layer.masksToBounds = true
        
        
        time.translatesAutoresizingMaskIntoConstraints = false
        frequency.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupView() {
        addSubview(remedyLabel)
        addSubview(removeButton)
        addSubview(time)
        addSubview(frequency)
        
        removeButton.addTarget(self, action: #selector(removeButtonTapped), for: .touchUpInside)

        setupConstraints()
    }
    
    public func configure(with remedy: Medication) {
        self.medication = remedy
        remedyLabel.text = remedy.remedy
        time.label.text = remedy.time
        frequency.label.text = remedy.recurrence
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 100),
            
            remedyLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Spacing.small),
            remedyLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Spacing.small),
            removeButton.leadingAnchor.constraint(equalTo: remedyLabel.trailingAnchor, constant: Spacing.small),
            removeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Spacing.small),
            
            removeButton.widthAnchor.constraint(equalToConstant: 32), // or an appropriate width
            removeButton.heightAnchor.constraint(equalToConstant: 32), // or an appropriate height
            
            time.topAnchor.constraint(equalTo: remedyLabel.bottomAnchor, constant: Spacing.tiny),
            time.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Spacing.small),
            time.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Spacing.tiny),
            time.heightAnchor.constraint(equalToConstant: 20),
            
            frequency.topAnchor.constraint(equalTo: time.topAnchor),
            frequency.leadingAnchor.constraint(equalTo: time.trailingAnchor, constant: Spacing.small),
            frequency.heightAnchor.constraint(equalToConstant: 20),
            frequency.bottomAnchor.constraint(equalTo: time.bottomAnchor),
        ])
        
    }
}
