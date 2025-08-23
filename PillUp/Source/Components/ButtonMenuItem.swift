//
//  ButtonMenuItem.swift
//  PillUp
//
//  Created by Diogo on 17/08/2025.
//

import UIKit
import Foundation

enum ButtonMenuItemType {
    case newMedication
    case listMedication
}

class ButtonMenuItem: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = Colors.gray100
        self.layer.cornerRadius = Spacing.medium
        self.layer.masksToBounds = true
        self.layer.borderColor =  Colors.gray300.cgColor
        self.layer.borderWidth = 1
        
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(avatarImageView)
        addSubview(actionButton)
        setupConstraints()
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = Spacing.medium
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .red
        return imageView
    }()
    
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.tintColor = .systemGray
        button.backgroundColor = .clear
        button.setTitle(nil, for: .normal)
        return button
    }()
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            avatarImageView.widthAnchor.constraint(equalToConstant: 80),
            avatarImageView.heightAnchor.constraint(equalToConstant: 80),
            
            titleLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: actionButton.leadingAnchor, constant: -10),
            
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            actionButton.topAnchor.constraint(equalTo: self.topAnchor),
            actionButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            actionButton.widthAnchor.constraint(equalToConstant: 44),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    public func configure(
        title: String,
        subtitle: String,
        avatarImage: UIImage? = nil,
    ) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
        if let image = avatarImage {
            avatarImageView.image = image
        } else {
            avatarImageView.image = UIImage(systemName: "person.circle")
        }
        
       
            
        
    }
}
