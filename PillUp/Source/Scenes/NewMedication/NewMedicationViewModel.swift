//
//  NewMedicationViewModel.swift
//  PillUp
//
//  Created by Diogo on 18/08/2025.
//

import CoreData

class NewMedicationViewModel {
    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext = PersistenceController.shared.context) {
        self.context = context
    }

    func addNewMedication(
        remedy: String,
        time: String,
        recurrence: String,
        takeNow: Bool
    ) {
        let medication = MedicationDataModel(context: context)
        
        medication.remedy = remedy
        medication.time = time
        medication.recurrence = recurrence
        medication.takeNow = takeNow

        do {
            try context.save()
            print("Medication saved to Core Data")
            let all = fetchAllMedications()
            print("All Medications: \(all)")
            
            for med in all {
                print("Remedy: \(med.remedy ?? "") | Time: \(med.time ?? "") | Recurrence: \(med.recurrence ?? "") | TakeNow: \(med.takeNow)")
            }
            
        } catch {
            print("Failed to save medication: \(error)")
        }
    }
    
    func fetchAllMedications() -> [MedicationDataModel] {
            let fetchRequest: NSFetchRequest<MedicationDataModel> = MedicationDataModel.fetchRequest()
            do {
                let medications = try context.fetch(fetchRequest)
                return medications
            } catch {
                print("Failed to fetch medications: \(error)")
                return []
            }
        }
}
