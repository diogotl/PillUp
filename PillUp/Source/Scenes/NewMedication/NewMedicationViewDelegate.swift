//
//  NewMedicationViewDelegate.swift
//  PillUp
//
//  Created by Diogo on 18/08/2025.
//

protocol NewMedicationViewDelegate: AnyObject {
    func handleSaveButtonTapped(
        remedy: String,
        time: String,
        recurrence: String,
        takeNow: Bool
    )
}
