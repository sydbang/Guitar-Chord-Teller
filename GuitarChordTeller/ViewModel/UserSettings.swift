//
//  UserSettings.swift
//  ChordTeller
//
//  Created by Sunghee Bang on 2021-11-29.
//

import Foundation
import Combine

class UserSettings: ObservableObject {
    
    @Published var firstTimeUser: Bool {
        didSet {
            UserDefaults.standard.set(firstTimeUser, forKey: "isFirstTimeUser")
        }
    }
    @Published var leftHanded: Bool {
        didSet {
            UserDefaults.standard.set(leftHanded, forKey: "isleftHanded")
        }
    }
    @Published var stringsIndex: [Int] = []
    
    init() {
        self.firstTimeUser = UserDefaults.standard.object(forKey: "isFirstTimeUser") as? Bool ?? true
        self.leftHanded = UserDefaults.standard.object(forKey: "isleftHanded") as? Bool ?? false
        
        updateStringIndex()
    }
    func updateStringIndex() {
        stringsIndex = (leftHanded ? [0, 1, 2, 3, 4, 5]:[5, 4, 3, 2, 1, 0])
    }
}
