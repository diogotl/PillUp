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
    
    public init(){
        
    }
    
    func start() -> UINavigationController? {
        
        let startViewController = SplashViewController(
            flowDelegate: self
        )
        self.navigationController = UINavigationController(rootViewController: startViewController)
        return navigationController
    }
}

extension Coordinator: SplashViewFlowDelegate {
    func openLoginBottomSheet() {
        let loginBottomSheet = LoginBottomSheetViewController(
            
        )
        loginBottomSheet.modalPresentationStyle = .overCurrentContext
        loginBottomSheet.modalTransitionStyle = .crossDissolve
        navigationController?.present(loginBottomSheet, animated: true) {
            loginBottomSheet.animateShow()
        }
    }
}
