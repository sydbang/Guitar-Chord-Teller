//
//  GuitarHomeView.swift
//  ChordTeller
//
//  Created by Sunghee Bang on 2022-05-18.
//

import SwiftUI

struct GuitarHomeView: View {
    
    var body: some View {
        VStack {
            GuitarFretTop()
                .padding(.horizontal)
            
            GuitarFretView()
        }
    }
}

struct GuitarHomeView_Previews: PreviewProvider {
    static var previews: some View {
        GuitarHomeView()
    }
}
