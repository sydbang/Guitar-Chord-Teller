//
//  GuitarFretRow.swift
//  GuitarChordTeller
//
//  Created by Sunghee Bang on 2021-11-10.
//

import SwiftUI

let stringCount = 6

struct GuitarFretRow: View {
    var body: some View {
        HStack (spacing: 30) {
            ForEach(0..<stringCount) { index in
                GuitarFretButton()
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
