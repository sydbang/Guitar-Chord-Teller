//
//  GuitarSettingView.swift
//  ChordTeller
//
//  Created by Sunghee Bang on 2021-11-22.
//

import SwiftUI

struct GuitarSettingView: View {
    
    @EnvironmentObject var userChord:GuitarChordModel
    @State var leftHanded = false
    
    var body: some View {
        HStack {
            Button {
                userChord.clearAll()
            } label: {
                Text("clear all")
            }
            Spacer()
            /*
             //TODo leftie
            Toggle(isOn: $leftHanded, label: {
                Text("Left Handed View")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .foregroundColor(Constants.blue)
            })
                .toggleStyle(SwitchToggleStyle(tint: Constants.blue))
            */
        }

    }
}

struct GuitarSettingView_Previews: PreviewProvider {
    static var previews: some View {
        GuitarSettingView()
    }
}
