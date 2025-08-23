//
//  Badge.swift
//  PillUp
//
//  Created by Diogo on 20/08/2025.
//

import Foundation
import UIKit

class Badge: UIView {
    
    init(
        //frame: CGRect = .zero,
        icon: String,
        labelText: String
    ){
        super.init(frame: .zero)
        self.iconImageView.image = UIImage(systemName: icon)
        self.label.text = labelText
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        //imageView.image = UIImage(systemName: "xmark")
        imageView.tintColor = Colors.gray200
        return imageView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.text = NSLocalizedString("badge.text", comment: "Badge Text")
        label.font = Typography.label
        label.textColor = Colors.gray200
        return label
    }()
        
    
    private func setupView() {
        self.backgroundColor = Colors.gray400
        self.layer.cornerRadius = Spacing.tiny
        self.layer.masksToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
    
        addSubview(iconImageView)
        addSubview(label)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            iconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 16),
            iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Spacing.tiny),

            label.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: Spacing.tiny),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Spacing.tiny),

            self.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
