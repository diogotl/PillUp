//
//  SplashViewController.swift
//  PillUp
//
//  Created by Diogo on 15/08/2025.
//

import UIKit
import Foundation

class SplashViewController: UIViewController {
    
    let contentView = SplashView ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(contentView)
        setupView()
        setupGesture()
        
        // timer
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.showLoginBottomSheet()
        }
        
    }
    
    private func setupView() {
        setupConstraints()
        view.backgroundColor = .red
    }
    
    private func setupConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showLoginBottomSheet))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func showLoginBottomSheet() {
        let loginBottomSheet = LoginBottomSheetViewController()
        loginBottomSheet.modalPresentationStyle = .overCurrentContext
        loginBottomSheet.modalTransitionStyle = .crossDissolve
        self.present(loginBottomSheet, animated: false) {
            loginBottomSheet.animateShow()
        }
    }
}
