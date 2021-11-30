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
    
    init() {
        self.firstTimeUser = UserDefaults.standard.object(forKey: "isFirstTimeUser") as? Bool ?? true
    }
}
