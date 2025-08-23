//
//  MedicationListViewController.swift
//  PillUp
//
//  Created by Diogo on 19/08/2025.
//

import Foundation
import UIKit

class MedicationListViewController: UIViewController {
    
    let medications = [
        Medication(id: UUID(), remedy: "Aspirin", time: "08:00 AM", recurrence: "Daily", takeNow: false),
        Medication(id: UUID(), remedy: "Ibuprofen", time: "12:00 PM", recurrence: "Twice a week", takeNow: true),
        Medication(id: UUID(), remedy: "Paracetamol", time: "06:00 PM", recurrence: "Every other day", takeNow: false)
    ]
    
    let contentView: MedicationListView
    
    let viewModel: MedicationListViewModel
    
    //weak var delegate: Medication?
    
    init(
        contentView: MedicationListView,
        viewModel: MedicationListViewModel
    ) {
        self.contentView = contentView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    @objc
    private func settingsTapped() {
        // Handle settings button tap
        print("Settings tapped")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        viewModel.onDelete = { [weak self]  in
            //medications
            print("Medication deleted")
            
        }
    }
    
    private func setupView() {
        view.addSubview(contentView)
        contentView.backgroundColor = Colors.gray600
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
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

extension MedicationListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return medications.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MedicationCell.identifier, for: indexPath) as? MedicationCell else {
            return UITableViewCell()
        }
        let medication = medications[indexPath.section]
        cell.delegate = self
        cell.configure(with: medication)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 16
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let spacer = UIView()
        spacer.backgroundColor = .clear
        return spacer
    }
    
    //quando pressionar
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let medication = medications[indexPath.section]
        print("Selected medication with ID: \(medication.id)")
        
            viewModel.deleteMedication(uuid: medication.id)
        
    }
}

extension MedicationListViewController: MedicationCellDelegate {
    func handleRemoveMedicationButtonTapped(id: UUID) {
        viewModel.deleteMedication(uuid: id)
        
    }
}
