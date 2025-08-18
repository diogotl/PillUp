//
//  MakeSplashViewController.swift
//  PillUp
//
//  Created by Diogo on 16/08/2025.
//

import UIKit

class Factory: FactoryProtocol {
    func makeNewMedicationViewController() -> NewMedicationViewController {
        let contentView = NewMedicationView()
        let viewModel = NewMedicationViewModel()
        
        let controller = NewMedicationViewController(
            contentView: contentView,
            viewModel: viewModel
        )
        return controller
    }
    
    
    
    func makeSplashViewController(flowDelegate: SplashViewFlowDelegate) -> SplashViewController {
        let contentView = SplashView ()
        
        
        let controller = SplashViewController(
            contentView: contentView,
            flowDelegate: flowDelegate
        )
        return controller
    }
    
    func makeLoginBottomSheetViewController(
        flowDelegate:LoginBottomSheetFlowDelegate
    ) -> LoginBottomSheetViewController {
        let contentView = LoginBottomSheetView()
        let viewModel = LoginBottomSheetViewModel()
        let controller = LoginBottomSheetViewController(
            contentView: contentView,
            viewModel: viewModel,
            flowDelegate: flowDelegate
        )
        return controller
    }
    
    func makeHomeViewController(
        flowDelegate: HomeViewFlowDelegate?
    ) -> HomeViewController {
        let contentView = HomeView()
        let controller = HomeViewController(
            contentView: contentView,
            flowDelegate: flowDelegate
        )
        return controller
    }
}


