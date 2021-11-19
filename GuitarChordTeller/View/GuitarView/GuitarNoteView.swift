//
//  GuitarNoteView.swift
//  GuitarChordTeller
//
//  Created by Sunghee Bang on 2021-11-13.
//

import SwiftUI

struct GuitarNoteView: View {

    var spacingIn: CGFloat
    
    @EnvironmentObject var userChord:GuitarChordModel
    
    var body: some View {
        HStack (spacing: spacingIn){
            
            ForEach ((0..<Constants.stringCount).reversed(), id: \.self) { index in
                
                Button  {
                    userChord.stringsEnabled[index].toggle()
                    
                    if userChord.stringsEnabled[index] == false {
                        for j in 0..<Constants.fretCount {
                            userChord.fretPressed[j][index] = false
                            userChord.pressedFretIndex[index] = 0
                        }
                    }

                    
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
            }


        }
    }
}

