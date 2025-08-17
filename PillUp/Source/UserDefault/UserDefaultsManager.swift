//
//  UserDefaultsManager.swift
//  PillUp
//
//  Created by Diogo on 16/08/2025.
//
import Foundation

class UserDefaultsManager {
    
    private static let userKey = "userKey"
    
    static func saveUser(_ user: User) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            UserDefaults.standard.set(encoded, forKey: userKey)
        }
    }
    
    static func loadUser() -> User? {
        if let userData = UserDefaults.standard.data(forKey: userKey) {
            
            let decoder = JSONDecoder()
            
            if let user = try? decoder.decode(User.self, from: userData) {
                return user
            }
            
            
        }
        return nil
    }
    
    static func removeUser() -> Void {
        UserDefaults.standard.removeObject(forKey: userKey)
        UserDefaults.standard.synchronize()
    }
}
