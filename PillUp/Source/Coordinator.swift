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
        
        let startViewController = SplashViewController()
        self.navigationController = UINavigationController(rootViewController: startViewController)
        return navigationController
    }
}
