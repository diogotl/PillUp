//
//  HomeViewController.swift
//  PillUp
//
//  Created by Diogo on 16/08/2025.
//
import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    let contentView: HomeView
    
    weak var flowDelegate: HomeViewFlowDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavBar()
    }
    
    init(
        contentView: HomeView,
        flowDelegate: HomeViewFlowDelegate?
    ) {
        self.contentView = contentView
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.delegate = self
        view.addSubview(contentView)
        
        
        
        setupConstraints()
    }
    
    private func setupNavBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.shadowColor = nil
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        
        navigationController?.navigationBar.isHidden = false
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "rectangle.portrait.and.arrow.forward"),
            style: .plain,
            target: self,
            action: #selector(settingsTapped)
        )
    }
    
    @objc private func settingsTapped() {
        UserDefaultsManager.removeUser()
        self.returnToSplashScreen()
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
}

extension HomeViewController: HomeViewFlowDelegate {
    func goToNewMedicationScreen() {
        flowDelegate?.goToNewMedicationScreen()
    }
    
    func returnToSplashScreen() {
        flowDelegate?.returnToSplashScreen()
    }
    
}

extension HomeViewController: HomeViewDelegate {
    func handleNavigateToNewMedicineButtonTapped() {
        flowDelegate?.goToNewMedicationScreen()
    }
    
    func handleLogoutButtonTapped() {
        print("chegou")
    }
}

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private func selectProfileImage() {
        let imagePicker = UIImagePickerController()
        
        
        imagePicker.delegate = self
        
        
        imagePicker.sourceType = .photoLibrary
        
        
        imagePicker.allowsEditing = true
        
        
        self.present(imagePicker, animated: true)
        
        
    }
    
    
    
    
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        if let editedImage = info[.editedImage] as? UIImage {
            
            
            contentView.imageView.image = editedImage
            
            
        } else if let originalImage = info[.originalImage] as? UIImage {
            contentView.imageView.image = originalImage
        }
        
        dismiss(animated: true)
        
        
    }
    
    
    
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        
        dismiss(animated: true)
        
        
    }
    
    
}



