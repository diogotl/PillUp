//
//  MedicationListViewModel.swift
//  PillUp
//
//  Created by Diogo on 20/08/2025.
//

import Foundation
import CoreData
import UserNotifications

class MedicationListViewModel {
    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    var onDelete: (() -> Void)?

    func deleteMedication(uuid: UUID) {
        let fetchRequest: NSFetchRequest<MedicationDataModel> = MedicationDataModel.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", uuid as CVarArg)

        do {
            if let medication = try context.fetch(fetchRequest).first {
                context.delete(medication)
                try context.save()
                print("Deleted medication with UUID: \(uuid)")
                removeNotifications(for: medication.remedy ?? "")
                onDelete?()
            } else {
                print("Medication not found for UUID: \(uuid)")
            }
        } catch {
            print("Failed to delete medication: \(error)")
        }
    }
    
    func removeNotifications(for remedy: String) {
        let center = UNUserNotificationCenter.current()
        let identifiers = (0..<24).map { "\(remedy)-\($0)" }
        center.removePendingNotificationRequests(withIdentifiers: identifiers)
        print("Removed notifications for remedy: \(remedy)")
    }
}
