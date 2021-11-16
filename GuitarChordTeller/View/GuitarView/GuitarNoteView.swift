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
                        }
                    }

                    print("pressed: \(userChord.fretPressed)")

                    print(userChord.stringsEnabled)
                } label: {
                    if userChord.stringsEnabled[index] == true && userChord.chord.chordArray[index] != nil {
                        Text(userChord.chord.chordArray[index]!)
                    } else {
                        Text("X")
                    }
                }

                
                /*
                Button
                
                
                ({
                            if userChord.stringEnabled[index] == true {
                        Text(userChord.chord.chordArray[index])
                    } else {
                        Text("X")
                    } }) {
                    userChord.stringsEnabled[index].toggle()
                }
 */
            }


        }
    }
}

struct GuitarNoteView_Previews: PreviewProvider {
    static var previews: some View {
        GuitarNoteView()
    }
}
