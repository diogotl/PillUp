//
//  Factory.swift
//  PillUp
//
//  Created by Diogo on 16/08/2025.
//

import Foundation
import UIKit

protocol FactoryProtocol: AnyObject {
    func makeSplashViewController(flowDelegate: SplashViewFlowDelegate) -> SplashViewController
    func makeLoginBottomSheetViewController(flowDelegate: LoginBottomSheetFlowDelegate) -> LoginBottomSheetViewController
    func makeHomeViewController(
        flowDelegate: HomeViewFlowDelegate?
    ) -> HomeViewController
    func makeNewMedicationViewController() -> NewMedicationViewController
    func makeMedicationListViewController() -> MedicationListViewController
        
}

