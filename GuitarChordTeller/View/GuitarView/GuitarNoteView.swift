//
//  GuitarNoteView.swift
//  GuitarChordTeller
//
//  Created by Sunghee Bang on 2021-11-13.
//

import SwiftUI

struct GuitarNoteView: View {

    @EnvironmentObject var userChord:GuitarChordModel
    @EnvironmentObject var userDefaults:UserSettings
    
    var body: some View {
        HStack {
            
            ForEach (userDefaults.stringsIndex, id: \.self) { index in
                Spacer()
                Button  {
                    userChord.stringsEnabled[index].toggle()
                    
                    if userChord.stringsEnabled[index] == false {
                        for j in 0..<Constants.fretCount {
                            userChord.fretPressed[j][index] = false
                            userChord.pressedFretIndex[index] = 0
                        }
                    }
                    userChord.getChord()
                    
                } label: {
                    if userChord.stringsEnabled[index] == true {
                        if userChord.pressedFretIndex[index] == 0 {
                            Text(userChord.stringArray[index]!)
                        } else {

                            Text(userChord.chordArray[index]!)
                        }
                        
                    } else {
                        Text("X")
                    }
                }
                .accentColor(Constants.blue)
                Spacer()
            }


        }
    }
}

