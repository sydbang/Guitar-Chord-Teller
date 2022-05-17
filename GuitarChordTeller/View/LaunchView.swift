//
//  LaunchView.swift
//  GuitarChordTeller
//
//  Created by Sunghee Bang on 2021-11-08.
//

import SwiftUI

struct LaunchView: View {
    
    @EnvironmentObject var model: GuitarChordModel
    @EnvironmentObject var userSettings: UserSettings
    
    var body: some View {
        if userSettings.firstTimeUser == true {
            HowToView()
                
        } else {
            TopTabView()
        }
        
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
