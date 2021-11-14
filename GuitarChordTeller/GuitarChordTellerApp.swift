//
//  GuitarChordTellerApp.swift
//  GuitarChordTeller
//
//  Created by Sunghee Bang on 2021-09-13.
//

import SwiftUI

@main
struct GuitarChordTellerApp: App {
    var guitarChordModel = GuitarChordModel()
    
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(guitarChordModel)
        }
    }
}
