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
    let viewModel: LoginBottomSheetViewModel;
    
    weak var flowDelegate: LoginBottomSheetFlowDelegate?
    
    init(
        contentView: LoginBottomSheetView,
        viewModel: LoginBottomSheetViewModel,
        flowDelegate: LoginBottomSheetFlowDelegate?
    ) {
        self.contentView = contentView
        self.viewModel = viewModel
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentView.delegate = self
        
        setupUI()
        setupGesture()
        bindLoginViewModel()
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
        
        let heightConstraint = contentView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5)
        heightConstraint.isActive = true
    }
    
    
    private func setupGesture() {
        //
    }
    
    private func handlePanGesture() {
        //
    }
    
    private func bindLoginViewModel(){
        viewModel.successResult = { [weak self] in
            self?.dismiss(animated: true, completion: nil)
            self?.flowDelegate?.goToHomeScreen()
        }
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
