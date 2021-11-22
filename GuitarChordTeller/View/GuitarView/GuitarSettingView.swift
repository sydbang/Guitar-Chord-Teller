//
//  GuitarSettingView.swift
//  ChordTeller
//
//  Created by Sunghee Bang on 2021-11-22.
//

import SwiftUI

struct GuitarSettingView: View {
    
    @EnvironmentObject var userChord:GuitarChordModel
    
    
    var body: some View {
        HStack {
            Button {
                userChord.clearAll()
            } label: {
                Text("clear all")
            }
            Spacer()
            
            //TODo leftie
            Toggle(isOn: $userChord.leftHanded, label: {
                Text("Left Handed View")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .foregroundColor(Constants.blue)
            })
            .toggleStyle(SwitchToggleStyle(tint: Constants.blue))
            
        }
        .onChange(of: userChord.leftHanded, perform: { value in
            userChord.updateStringIndex()
        })
        
    }
}

struct GuitarSettingView_Previews: PreviewProvider {
    static var previews: some View {
        GuitarSettingView()
    }
}