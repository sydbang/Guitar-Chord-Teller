//
//  ChordGuitarNoteView.swift
//  ChordTeller
//
//  Created by Sunghee Bang on 2024-04-11.
//

import SwiftUI

struct ChordGuitarNoteView: View {
    @EnvironmentObject var userDefaults:UserSettings
    
    var stringsEnabled: [Bool]
    var pressedFretIndex: [Int]
    var stringScaleIndex: [Int]
    
    var body: some View {
        HStack {
            ForEach (userDefaults.stringsIndex, id: \.self) { index in
                Spacer()
                if stringsEnabled[index] == true {
                    if pressedFretIndex[index] == 0 {
                        Text(GuitarChord().grabNoteOnC(index: stringScaleIndex[index]))
                    } else {
                        Text(GuitarChord().grabNoteOnC(index: stringScaleIndex[index]+pressedFretIndex[index]))
                    }
                    
                } else {
                    Text("X")
                        .foregroundStyle(.gray)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ChordGuitarNoteView(stringsEnabled: [], pressedFretIndex: [], stringScaleIndex: [])
}
