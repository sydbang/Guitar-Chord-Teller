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

                Text(userChord.chord.sixthString!)

                Text(userChord.chord.fifthString!)

                Text(userChord.chord.fourthString!)

                Text(userChord.chord.thirdString!)

                Text(userChord.chord.secondString!)

                Text(userChord.chord.firstString!)

        }
    }
}

struct GuitarNoteView_Previews: PreviewProvider {
    static var previews: some View {
        GuitarNoteView()
    }
}
