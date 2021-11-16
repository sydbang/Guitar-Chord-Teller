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
        
        Button {
            //userChord.fretPressed[fret][string].toggle()
            toggleFunction()
            userChord.newButtonPressed(fretNum: fret, stringIndex: string)
        } label: {
            Image(systemName: pressed == false ? "circle" : "circle.fill")
            
        }
        .accentColor(.red)
        .disabled(!enabled)
        
        
    }
}

