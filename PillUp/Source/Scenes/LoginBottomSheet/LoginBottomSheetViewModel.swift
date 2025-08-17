//
//  LoginBottomSheetViewModel.swift
//  PillUp
//
//  Created by Diogo on 15/08/2025.
//

class LoginBottomSheetViewModel {
    
    var successResult: (() -> Void)?
    
    func authenticate(email:String, password:String) {
        
        let emailVM = email
        let passwordVM = password
        
        let isLoggedIn = Double.random(in: 0...1)
        
        if isLoggedIn > 0.5 {
            // Simulate successful login
            print("Login successful for email: \(emailVM)")
            UserDefaultsManager.saveUser(User(email: emailVM))
            successResult?()
        } else {
            print("Login failed for email: \(emailVM)")
            
            
        }
        
        
    }
}
