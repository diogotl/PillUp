//
//  Coordinator.swift
//  PillUp
//
//  Created by Diogo on 15/08/2025.
//

import Foundation
import UIKit

class Coordinator {
    
    private var navigationController: UINavigationController?
    private let factory: Factory
    
    public init(factory: Factory) {
        self.factory = factory
    }
    
    func start() -> UINavigationController? {
        
        let startViewController = factory.makeSplashViewController(flowDelegate: self)
        self.navigationController = UINavigationController(rootViewController: startViewController)
        return navigationController
    }
}

extension Coordinator: SplashViewFlowDelegate {
    func openHomeScreen() {
        let homeViewController = factory.makeHomeViewController(flowDelegate: self)
        navigationController?.pushViewController(homeViewController, animated: true)
    }
    
    func openLoginBottomSheet() {
        let loginBottomSheet = factory.makeLoginBottomSheetViewController(
            flowDelegate: self
        )
        loginBottomSheet.modalPresentationStyle = .overCurrentContext
        loginBottomSheet.modalTransitionStyle = .crossDissolve
        navigationController?.present(loginBottomSheet, animated: false) {
            loginBottomSheet.animateShow()
        }
    }
}

extension Coordinator: LoginBottomSheetFlowDelegate {
    func goToHomeScreen(
    ) {
        let homeViewController = factory.makeHomeViewController(
            flowDelegate: self
        )
        navigationController?.pushViewController(homeViewController, animated: true)
    }
}

extension Coordinator: HomeViewFlowDelegate {
    func goToMedicationListScreen() {
        let medicationListViewController = factory.makeMedicationListViewController()
        navigationController?.pushViewController(medicationListViewController, animated: true)
    }
    
    func goToNewMedicationScreen() {
        let newMedicationViewController = factory.makeNewMedicationViewController()
        navigationController?.pushViewController(newMedicationViewController, animated: true)
    }
    
    func returnToSplashScreen() {
        navigationController?.popToRootViewController(animated: true)
    }
}
