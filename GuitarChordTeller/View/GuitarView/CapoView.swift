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
                VStack {
                    Image(systemName: "arrowtriangle.up.circle.fill")
                        .onTapGesture {
                            if fretNum > 0 {
                                userChord.capoOnFret = fretNum - 1
                            }
                        }
                    Image(systemName: "arrowtriangle.down.circle.fill")
                        .onTapGesture {
                            if fretNum < Constants.fretCount {
                                userChord.capoOnFret = fretNum + 1
                            }
                        }
                }
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
