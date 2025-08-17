//
//  Medication.swift
//  PillUp
//
//  Created by Diogo on 17/08/2025.
//

import Foundation

struct Medication: Codable {
    let id: UUID
    let remedy: String
    let time: String
    let recurrence: String
    let takeNow: Bool
}

