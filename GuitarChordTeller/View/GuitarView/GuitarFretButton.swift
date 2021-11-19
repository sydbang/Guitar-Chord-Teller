//
//  GuitarFretButton.swift
//  GuitarChordTeller
//
//  Created by Sunghee Bang on 2021-11-10.
//

import SwiftUI

struct GuitarFretButton: View {
    
    @EnvironmentObject var userChord:GuitarChordModel
    
    var pressed: Bool
    var enabled: Bool
    var fret: Int
    var string: Int

    
    var toggleFunction: () -> ()
    
    // Do not make a @State variable when you want property to take in something and change data
    
    var body: some View {
        //GeometryReader {geo in
            ZStack {
                /*
                Path({ path in
                    path.move(to: CGPoint(x: geo.size.width/2, y: -geo.size.height*6))
                    path.addLine(to: CGPoint(x: geo.size.width/2, y: geo.size.height*6))
                    
                    
                })
                .stroke(Color.black, style: StrokeStyle(lineWidth: 2))
                */
                
                Button {
                    //userChord.fretPressed[fret][string].toggle()
                    toggleFunction()
                    userChord.newButtonPressed(fretNum: fret, stringIndex: string)
                    if userChord.fretPressed[fret][string] == false {
                        userChord.pressedFretIndex[string] = 0
                        userChord.chordArray[string] = userChord.stringArray[string]
                        //chordArray[stringIndex] = stringArray[stringIndex]!
                    }
                } label: {
                    /*
                    if pressed {
                        Circle()
                    } else {
                        Circle()
                            .stroke()
                    }
 */
                    Image(systemName: pressed == false ? "circle" : "circle.fill")
                    
                }
                .accentColor(Constants.turquoise)
                .disabled(!enabled)
            }
            
            
            
        //}
    }
}

