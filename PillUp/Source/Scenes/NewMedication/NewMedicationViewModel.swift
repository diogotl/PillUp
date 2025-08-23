//
//  NewMedicationViewModel.swift
//  PillUp
//
//  Created by Diogo on 18/08/2025.
//

import CoreData
import UserNotifications

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
            sheduleNotifications(
                remedy: remedy,
                time: time,
                recurrence: recurrence
            )
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
    
    private func sheduleNotifications(remedy: String, time: String, recurrence: String) {
        
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "Hora de tomar o remédio"
        content.body = "Está na hora de tomar o remédio: \(remedy)"
        content.sound = .default
        
        guard let interval = getIntervalInHours(from: recurrence) else {
            return
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        guard let initialDate = formatter.date(from: time) else {
            return
        }
        
        let calendar = Calendar.current
        var currentDate = initialDate
        for i in 00..<(24/interval){
            let components = calendar.dateComponents([.hour, .minute], from: currentDate)
            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
            
            let request = UNNotificationRequest(
                identifier: "\(remedy)-\(i)",
                content: content,
                trigger: trigger
            )
            center.add(request) { error in
                if let error = error {
                    print("Failed to schedule notification: \(error)")
                } else {
                    print("Notification scheduled for \(remedy) at \(time) with recurrence: \(recurrence)")
                }
            }
            
            currentDate = calendar.date(byAdding: .hour, value: interval, to: currentDate) ?? Date()
        }
    }
    
    private func getIntervalInHours(from recurrence:String) -> Int? {
        
        switch recurrence {
        case "De hora em hora":
            return 1
        case "A cada 2 horas":
            return 2
        case "A cada 4 horas":
            return 4
        case "A cada 8 horas":
            return 8
        case "A cada 12 horas":
            return 12
        case "A cada dia":
            return 24
        default:
            return nil
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
