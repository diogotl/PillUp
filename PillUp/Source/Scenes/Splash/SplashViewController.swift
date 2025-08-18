//
//  SplashViewController.swift
//  PillUp
//
//  Created by Diogo on 15/08/2025.
//

import UIKit
import Foundation

class SplashViewController: UIViewController {
    
    let contentView: SplashView
    weak var flowDelegate: SplashViewFlowDelegate?
    
    init(
        contentView: SplashView,
        flowDelegate: SplashViewFlowDelegate?) {
            self.flowDelegate = flowDelegate
            self.contentView = contentView
            super.init(nibName: nil, bundle: nil)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(contentView)
        setupView()
        setupGesture()
        
        
        let isUserLoggedIn = UserDefaultsManager.loadUser() != nil
        
        if isUserLoggedIn {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.flowDelegate?.openHomeScreen()
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.showLoginBottomSheet()
            }
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
        flowDelegate?.openLoginBottomSheet()
    }
}
