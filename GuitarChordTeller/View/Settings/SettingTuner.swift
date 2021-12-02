//
//  SettingTuner.swift
//  ChordTeller
//
//  Created by Sunghee Bang on 2021-12-02.
//

import SwiftUI

struct SettingTunerView: View {
    
    @EnvironmentObject var userChord:GuitarChordModel
    @EnvironmentObject var userDefault: UserSettings
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("Standard") {
                    userChord.stringScaleIndex = [4, 11, 7, 2, 9, 4]
                }
            }
            
            HStack {
                ForEach (0..<Constants.stringCount) { index in
                    Picker("\(index) string index", selection: $userChord.stringScaleIndex[index]) {
                        ForEach(0..<userChord.chord.scaleArray.count) { scaleIndex in
                            Text(userChord.chord.scaleArray[scaleIndex]).tag(scaleIndex)
                        }
                    }
                }
            }
        }
    }
}

struct SettingTuner_Previews: PreviewProvider {
    static var previews: some View {
        SettingTunerView()
    }
}
