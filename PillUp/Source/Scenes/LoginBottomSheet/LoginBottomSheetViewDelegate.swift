//
//  LoginBottomSheetViewDelegate.swift
//  PillUp
//
//  Created by Diogo on 15/08/2025.
//

protocol LoginBottomSheetViewDelegate: AnyObject {
    func handleLoginButtonTapped(email: String, password: String)
}
