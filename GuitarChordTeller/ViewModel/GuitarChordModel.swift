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
        
        for index in ((0..<stringsEnabled.count).reversed()) {
            if stringsEnabled[index] {
                return chordArray[index]!
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
    
    func getChord() {
        displayChord = grabBase()
    }
    
    func newButtonPressed(fretNum: Int, stringIndex: Int) {
        for fret in 0..<Constants.fretCount {
            if fret == fretNum {
                pressedFretIndex[stringIndex] = fretNum + 1 //in real life fret number start from 1
                
                continue
            } else {
                fretPressed[fret][stringIndex] = false
            }
        }
    }
    
    func updateNote(PressedFretIndex: Int, CurrentNote: String) -> String {
        
        var currentIndex: Int = 0
        // Grab scale index
        for index in 0..<chord.scaleArray.count {
            if CurrentNote == chord.scaleArray[index] {
                currentIndex = index
            }
        }
        
        let newIndex = PressedFretIndex + currentIndex 
        let trueIndex = newIndex % chord.scaleArray.count
        
        return chord.scaleArray[trueIndex]
        
    }
}
