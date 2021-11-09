//
//  GuitarFretBoardView.swift
//  GuitarChordTeller
//
//  Created by Sunghee Bang on 2021-11-08.
//

import SwiftUI

struct GuitarFretBoardView: View {
    
    // index i, j should i make a dictionary where i is a key? j a number 0 - 24?
    // make -1 don't play?
    static var firstIndex = 0
    static var secondIndex = 0
    static var thirdIndex = 0
    static var fourthIndex = 0
    static var fifthIndex = 0
    static var sixthIndex = 0
    
    var body: some View {
        ScrollView {
            GeometryReader { geo in
                /*
                ForEach i in 1...6 {
                     
                    ForEach j in 1...25 {
                        Image(sysname: "circle")
                    }
                }
 */
                Text("hi")
                
            }
        }
    }
}

struct GuitarFretBoardView_Previews: PreviewProvider {
    static var previews: some View {
        GuitarFretBoardView()
    }
}
