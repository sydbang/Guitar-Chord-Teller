//
//  GuitarFretButton.swift
//  GuitarChordTeller
//
//  Created by Sunghee Bang on 2021-11-10.
//

import SwiftUI

struct GuitarFretButton: View {
    @State var pressed = false
    
    var body: some View {
        Button {
            pressed.toggle()
        } label: {
            Image(systemName: pressed == false ? "circle" : "circle.fill")
            
        }
        .accentColor(.gray)
    }
}

struct GuitarFretButton_Previews: PreviewProvider {
    static var previews: some View {
        GuitarFretButton()
            .previewLayout(.fixed(width: 100, height: 100))
    }
}
