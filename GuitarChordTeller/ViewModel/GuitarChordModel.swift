//
//  GuitarChordModel.swift
//  GuitarChordTeller
//
//  Created by Sunghee Bang on 2021-09-29.
//

import Foundation

class GuitarChordModel: ObservableObject {
    
    @Published var firstTimeUser = true
    
    var chord = GuitarChord()
    var baseIndex:Int
    
    init() {
        chord.firstString = "E"
        chord.secondString = "B"
        chord.thirdString = "G"
        chord.fourthString = "D"
        chord.fifthString = "A"
        chord.sixthString = "E"
        
        baseIndex = 0
    }
   
    
    func grabBase() -> String {
        if chord.sixthString != nil {
            return chord.sixthString!
        } else if chord.fifthString != nil {
            return chord.fifthString!
        } else if chord.fourthString != nil {
            return chord.fourthString!
        } else if chord.thirdString != nil {
            return chord.thirdString!
        } else if chord.secondString != nil {
            return chord.secondString!
        } else if chord.firstString != nil {
            return chord.firstString!
        } else { return "error"}
        
    }
}
