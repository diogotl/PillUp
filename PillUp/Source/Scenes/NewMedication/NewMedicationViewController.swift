//
//  NewMedicationViewController.swift
//  PillUp
//
//  Created by Diogo on 17/08/2025.
//

import Foundation
import UIKit

class NewMedicationViewController: UIViewController {
    
    let contentView: NewMedicationView
    let viewModel: NewMedicationViewModel
    
    init(
        contentView: NewMedicationView,
        viewModel: NewMedicationViewModel
    ) {
        self.contentView = contentView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        contentView.delegate = self
        view.addSubview(contentView)
        setupConstraints()
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

extension NewMedicationViewController: NewMedicationViewDelegate {
    func handleSaveButtonTapped(remedy: String, time: String, recurrence: String, takeNow: Bool) {
        viewModel.addNewMedication(
            remedy: remedy,
            time: time,
            recurrence: recurrence,
            takeNow: takeNow
        )
    }
}
