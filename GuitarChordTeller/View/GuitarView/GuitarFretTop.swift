//
//  GuitarSettingView.swift
//  ChordTeller
//
//  Created by Sunghee Bang on 2021-11-22.
//

import SwiftUI

struct GuitarFretTop: View {
    
    @EnvironmentObject var userChord:GuitarChordModel
    @Environment(\.managedObjectContext) private var viewContext
    
    
    var body: some View {
        HStack {
            Button {
                userChord.clearAll()
                
            } label: {
                Text("Clear All")
            }
            Spacer()
            
//            //TODo leftie
//            Toggle(isOn: $userChord.leftHanded, label: {
//                Text("Left Handed View")
//                    .frame(maxWidth: .infinity, alignment: .trailing)
//                    .foregroundColor(Constants.blue)
//            })
//            .toggleStyle(SwitchToggleStyle(tint: Constants.blue))
            
            NavigationLink(
                destination: SettingsView(),
                label: {
                    HStack {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                }
            )
            
        }
        
    }
}

struct GuitarSettingView_Previews: PreviewProvider {
    static var previews: some View {
        GuitarFretTop()
    }
}
