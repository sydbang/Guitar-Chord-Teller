//
//  CapoView.swift
//  ChordTeller
//
//  Created by Sunghee Bang on 2024-04-09.
//

import SwiftUI

struct CapoView: View {
    
    @EnvironmentObject var userChord:GuitarChordModel
    
    @State var fretNum: Int
    var body: some View {
        if fretNum == userChord.capoOnFret {
            HStack {
                Image(systemName: "line.3.horizontal")
                Rectangle()
                    .frame(height: 60)
            }
            .padding(.horizontal, 10)
        }
    }
}

#Preview {
    CapoView(fretNum: 1)
}
