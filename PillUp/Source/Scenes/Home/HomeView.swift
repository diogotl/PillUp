//
//  HomeView.swift
//  PillUp
//
//  Created by Diogo on 16/08/2025.
//

import Foundation
import UIKit

class HomeView: UIView {
    
    weak var delegate: HomeViewDelegate?
    
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "person.circle.fill")
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = Colors.secondaryBlueBase
        imageView.layer.cornerRadius = 99999
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = Colors.primaryRedBase
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private func avatarSetupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(avatarTapped))
        imageView.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func avatarTapped() {
        delegate?.handleLogoutButtonTapped()
    }
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bem-vindo ao PillUp"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        return view
    }()
    
    let menuItem: ButtonMenuItem = {
        let item = ButtonMenuItem()
        item.translatesAutoresizingMaskIntoConstraints = false
        item.configure(
            title: "Profile",
            subtitle: "View your profile",
            avatarImage: UIImage(systemName: "person.circle")
        )
        
        item.heightAnchor.constraint(equalToConstant: 100).isActive = true
        item.isUserInteractionEnabled = true
        return item
    }()
    
    private func setupMenuItemTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(menuItemTapped))
        menuItem.addGestureRecognizer(tapGesture)
    }
    
    private func setupMenuItem2TapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(menuItem2Tapped))
        menuItem1.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func menuItemTapped() {
        delegate?.handleNavigateToMedicineListButtonTapped()
    }
    
    @objc
    private func menuItem2Tapped() {
        delegate?.handleNavigateToNewMedicineButtonTapped()
    }

    let menuItem1: ButtonMenuItem = {
        let item = ButtonMenuItem()
        item.translatesAutoresizingMaskIntoConstraints = false
        item.configure(
            title: "Profile",
            subtitle: "View your profile",
            avatarImage: UIImage(systemName: "person.circle")
        )
        item.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return item
    }()
    
    let feedbackButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Feedback", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = Colors.gray700
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = Colors.gray100
        setupUI()
        avatarSetupTapGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(imageView)
        addSubview(welcomeLabel)
        addSubview(contentView)
        contentView.addSubview(menuItem)
        contentView.addSubview(menuItem1)
        contentView.addSubview(feedbackButton)
        
        setupConstraints()
        setupMenuItemTapGesture()
        setupMenuItem2TapGesture()
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: Spacing.medium),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Spacing.medium),
            
            imageView.widthAnchor.constraint(equalToConstant: 80),
            imageView.heightAnchor.constraint(equalToConstant: 80),
            
            welcomeLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Spacing.medium),
            welcomeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Spacing.medium),
            
            contentView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7),
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            menuItem.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Spacing.medium),
            menuItem.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Spacing.medium),
            menuItem.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Spacing.medium),
            
            menuItem1.topAnchor.constraint(equalTo: menuItem.bottomAnchor, constant: Spacing.medium),
            menuItem1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Spacing.medium),
            menuItem1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Spacing.medium),
            
            feedbackButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Spacing.medium),
            feedbackButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            feedbackButton.heightAnchor.constraint(equalToConstant: 44),
            
        ])
    }
    
    
    
}
