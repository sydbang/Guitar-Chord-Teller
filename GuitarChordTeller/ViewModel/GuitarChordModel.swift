//
//  GuitarChordModel.swift
//  GuitarChordTeller
//
//  Created by Sunghee Bang on 2021-09-29.
//

import Foundation

class GuitarChordModel: ObservableObject {
    
    @Published var firstTimeUser = true
    @Published var displayChord = "C Major"
    
    var chord = GuitarChord()
    var baseIndex:Int
    
    var scaleArray = ["C","C#","D","D#","E","F","F#","G","G#","A","A#","B","B#","C","C#","D","D#","E","F","F#","G","G#","A","A#","B","B#"]
    
    init() {
        chord.firstString = scaleArray[4]
        chord.secondString = scaleArray[11]
        chord.thirdString = scaleArray[7]
        chord.fourthString = scaleArray[2]
        chord.fifthString = scaleArray[9]
        chord.sixthString = scaleArray[4]
        
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
    
    func setBaseIndex() {
        let index = scaleArray.firstIndex { (note) -> Bool in

            if note == grabBase() {
                return true
            } else {
                return false
            }
        }
        baseIndex = index ?? 0
    }
}
