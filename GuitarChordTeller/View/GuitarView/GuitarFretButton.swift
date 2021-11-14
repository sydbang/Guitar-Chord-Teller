//
//  GuitarFretButton.swift
//  GuitarChordTeller
//
//  Created by Sunghee Bang on 2021-11-10.
//

import SwiftUI

struct GuitarFretButton: View {
    @State var pressed = false
    @State var enabled: Bool
    
    var body: some View {
        
        Button {
            pressed.toggle()
        } label: {
            Image(systemName: pressed == false ? "circle" : "circle.fill")
            
        }
        .accentColor(.gray)
        .disabled(!enabled)
    }
}

struct GuitarFretButton_Previews: PreviewProvider {
    static var previews: some View {
        GuitarFretButton(enabled: true)
            .previewLayout(.fixed(width: 100, height: 100))
    }
}
