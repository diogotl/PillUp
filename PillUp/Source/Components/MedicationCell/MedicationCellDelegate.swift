//
//  MedicationCellDelegate.swift
//  PillUp
//
//  Created by Diogo on 20/08/2025.
//
import Foundation

protocol MedicationCellDelegate: AnyObject {
    func handleRemoveMedicationButtonTapped(id: UUID)
}
