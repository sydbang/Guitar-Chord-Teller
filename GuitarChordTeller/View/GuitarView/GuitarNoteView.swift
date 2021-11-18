//
//  GuitarNoteView.swift
//  GuitarChordTeller
//
//  Created by Sunghee Bang on 2021-11-13.
//

import SwiftUI

struct GuitarNoteView: View {

    
    @EnvironmentObject var userChord:GuitarChordModel
    
    var body: some View {
        HStack (spacing: 40){
            
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
                    if userChord.stringsEnabled[index] == true && userChord.chordArray[index] != nil && userChord.stringArray[index] != nil {
                        if userChord.pressedFretIndex[index] == 0 {
                            Text(userChord.stringArray[index]!)
                        } else {

                            Text(userChord.chordArray[index]!)
                        }
                        
                    } else {
                        Text("X")
                    }
                }
            }


        }
    }
}

struct GuitarNoteView_Previews: PreviewProvider {
    static var previews: some View {
        GuitarNoteView()
    }
}
