//
//  GuitarFretRow.swift
//  GuitarChordTeller
//
//  Created by Sunghee Bang on 2021-11-10.
//

import SwiftUI


struct GuitarFretRow: View {
    
    @EnvironmentObject var userChord: GuitarChordModel
    
    var body: some View {
        HStack (spacing: 30) {
            ForEach((0..<Constants.stringCount).reversed(), id: \.self) { index in
                
                GuitarFretButton(enabled: userChord.stringsEnabled[index])
            }
        }
        
    }
}

struct GuitarFretRow_Previews: PreviewProvider {
    static var previews: some View {
        GuitarFretRow()
            .previewLayout(.fixed(width:300, height: 100))
    }
}
