//
//  GuitarDotView.swift
//  GuitarChordTeller
//
//  Created by Sunghee Bang on 2021-11-18.
//

import SwiftUI

struct GuitarDotView: View {
    
    var fretNum: Int
    
    var body: some View {
        HStack{
            
            if fretNum == 2 || fretNum == 4 || fretNum == 6 || fretNum == 8 || fretNum == 14 || fretNum == 16 || fretNum == 18 || fretNum == 20 {
                Circle()
                    .frame(height: 10)
                    .foregroundColor(Constants.blue)
            } else if fretNum == 11 {
                Spacer()
                Circle()
                    .frame(height: 10)
                    .foregroundColor(Constants.blue)
                Circle()
                    .frame(height: 10)
                    .foregroundColor(Constants.blue)
                Spacer()
            }
        }
    }
}

struct GuitarDotView_Previews: PreviewProvider {
    static var previews: some View {
        GuitarDotView(fretNum: 1)
    }
}
