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
    
    var chord = GuitarChord()
    var baseIndex:Int
    
    var scaleArray = ["C","C#","D","D#","E","F","F#","G","G#","A","A#","B","B#","C","C#","D","D#","E","F","F#","G","G#","A","A#","B","B#"]
    
    
    init() {
        
        chord.chordArray.append(scaleArray[4])
        chord.chordArray.append(scaleArray[11])
        chord.chordArray.append(scaleArray[7])
        chord.chordArray.append(scaleArray[2])
        chord.chordArray.append(scaleArray[9])
        chord.chordArray.append(scaleArray[4])
        
        baseIndex = 0
    }
   
    
    func grabBase() -> String {
        
        for note in chord.chordArray {
            if note != nil {
                return note!
            }
        }
        return ""
        
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
    
    func newButtonPressed(fretNum: Int, stringIndex: Int) {
        for fret in 0..<Constants.fretCount {
            if fret == fretNum {
                continue
            } else {
                fretPressed[fret][stringIndex] = false
            }
        }
    }
}
