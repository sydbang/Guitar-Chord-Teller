//
//  GuitarChordModel.swift
//  GuitarChordTeller
//
//  Created by Sunghee Bang on 2021-09-29.
//

import Foundation

class GuitarChordModel: ObservableObject {
    
    @Published var firstTimeUser = true
    @Published var displayChord = ""
    
    @Published var stringsEnabled = [true,true,true,true,true,true]
    
    @Published var fretPressed = Array(repeating: Array(repeating: false, count: Constants.stringCount), count: Constants.fretCount)
    
    @Published var chordArray: [String?] = []
    
    var chord = GuitarChord()
    @Published var baseIndex:Int = 0
    
    @Published var pressedFretIndex: [Int] = [0,0,0,0,0,0]

    
    init() {
        
        chordArray.append(chord.scaleArray[4])
        chordArray.append(chord.scaleArray[11])
        chordArray.append(chord.scaleArray[7])
        chordArray.append(chord.scaleArray[2])
        chordArray.append(chord.scaleArray[9])
        chordArray.append(chord.scaleArray[4])

    }
   
    
    func grabBase() -> String {
        
        for note in chordArray {
            if note != nil {
                return note!
            }
        }
        return ""
        
    }
     
    func setBaseIndex() {
        let index = chord.scaleArray.firstIndex { (note) -> Bool in

            if note == grabBase() {
                return true
            } else {
                return false
            }
        }
        baseIndex = index ?? 0
    }
    
    func newButtonPressed(fretNum: Int, stringIndex: Int) {
        for fret in 0..<Constants.fretCount {
            if fret == fretNum {
                pressedFretIndex[stringIndex] = fretNum
                continue
            } else {
                fretPressed[fret][stringIndex] = false
            }
        }
    }
    
    func updateNote(stringIndex: Int, pressedFretIndex: Int, CurrentNote: String) {
        // TODO
    }
}
