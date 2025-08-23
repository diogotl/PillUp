//
//  MedicationListView.swift
//  PillUp
//
//  Created by Diogo on 19/08/2025.
//

import Foundation
import UIKit

class MedicationListView: UIView {
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = NSLocalizedString("medicationList.title", comment: "Medication List Title")
        label.font = Typography.heading
        label.textColor = .black
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = NSLocalizedString("medicationList.description", comment: "Medication List Description")
        label.font = Typography.body
        label.textColor = .darkGray
        return label
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = Spacing.medium
        view.layer.masksToBounds = true
        return view
    }()
    
    let tableView: UITableView = {
        
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(MedicationCell.self, forCellReuseIdentifier: "MedicationCell")
        return tableView
    }()
    
    private func setupUI() {
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(contentView)
        contentView.addSubview(tableView)
        
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: Spacing.medium),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Spacing.medium),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Spacing.small),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Spacing.medium),
            
            contentView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7),
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            tableView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Spacing.medium),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Spacing.medium),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Spacing.medium),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Spacing.medium)
        ])
    }
    
  
    
}
