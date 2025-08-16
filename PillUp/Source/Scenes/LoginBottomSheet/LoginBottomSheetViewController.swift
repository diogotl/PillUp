//
//  LoginBottomSheetViewController.swift
//  PillUp
//
//  Created by Diogo on 15/08/2025.
//

import Foundation
import UIKit

class LoginBottomSheetViewController: UIViewController {
    
    var contentView: LoginBottomSheetView;
    let viewModel = LoginBottomSheetViewModel()
    
    init() {
        self.contentView = LoginBottomSheetView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentView = LoginBottomSheetView()
        self.contentView.delegate = self
        
        setupUI()
        setupGesture()
    }
    
    private func setupUI() {
        
        view.addSubview(contentView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        let heightConstraint = contentView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    
    private func setupGesture() {
        //
    }
    
    private func handlePanGesture() {
        //
    }
    
    func animateShow(completion: (() -> Void)? = nil) {
        self.view.layoutIfNeeded()
        contentView.transform = CGAffineTransform(translationX: 0, y: contentView.frame.height)
        UIView.animate(withDuration: 0.3, animations: {
            self.contentView.transform = .identity
            self.view.layoutIfNeeded()
        }) { _ in
            completion?()
        }
    }
}

extension LoginBottomSheetViewController: LoginBottomSheetViewDelegate {
    func handleLoginButtonTapped(
        email: String,
        password: String
    ) {
        viewModel.authenticate(email: email, password: password)
    }
}
