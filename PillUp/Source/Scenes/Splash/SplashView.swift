//
//  SplashView.swift
//  PillUp
//
//  Created by Diogo on 15/08/2025.
//

import Foundation
import UIKit

class SplashView: UIView{
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    let namingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "PillUp"
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI() {
        self.backgroundColor = .red
        self.addSubview(logoImageView)
        self.addSubview(namingLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),

            namingLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            namingLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
        ])
    }
}
