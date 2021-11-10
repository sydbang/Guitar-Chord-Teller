//
//  ChordTellerView.swift
//  GuitarChordTeller
//
//  Created by Sunghee Bang on 2021-11-10.
//

import SwiftUI

struct ChordTellerView: View {
    
    @EnvironmentObject var userChord: GuitarChordModel
    var body: some View {
        // Display the chord
        Text(userChord.displayChord)
            .font(.system(size: 40))
            .lineLimit(1)
            .padding(.horizontal, 20)
    }
}

struct ChordTellerView_Previews: PreviewProvider {
    static var previews: some View {
        ChordTellerView()
    }
}
