//
//  GuitarFretButton.swift
//  GuitarChordTeller
//
//  Created by Sunghee Bang on 2021-11-10.
//

import SwiftUI

struct GuitarFretButton: View {
    @State var pressed = false
    var enabled: Bool
    // Do not make a @State variable when you want property to take in something and change data
    
    var body: some View {
        
        Button {
            pressed.toggle()
        } label: {
            Image(systemName: pressed == false ? "circle" : "circle.fill")
            
        }
        .accentColor(.red)
        .disabled(!enabled)
        
        
    }
}

struct GuitarFretButton_Previews: PreviewProvider {
    static var previews: some View {
        GuitarFretButton(enabled: true)
            .previewLayout(.fixed(width: 100, height: 100))
    }
}
