//
//  PersistancyManager.swift
//  UI elements
//
//  Created by Алексей Олудин on 29.09.2024.
//

import Foundation

final class PersistancyManager {
    let userDefaults = UserDefaults.standard
    
    func saveAppStartsCount(_ appStartCount: Int) {
        userDefaults.setValue(appStartCount, forKey: "appStartCount")
        print("Saved \(appStartCount) to UserDefaults")
    }
    
    func getAppStartsCount() -> Int {
        let appStartCount = userDefaults.integer(forKey: "appStartCount")
        print("appStartCount = \(appStartCount)")
        return appStartCount
    }
}
