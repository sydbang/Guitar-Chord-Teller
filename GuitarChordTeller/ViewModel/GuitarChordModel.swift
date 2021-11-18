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
    
    @Published var stringArray: [String?] = []
    @Published var chordArray: [String?] = []
    
    var chord = GuitarChord()
    
    @Published var pressedFretIndex: [Int] = [0,0,0,0,0,0]

    
    init() {
        
        chordArray.append(chord.scaleArray[4])
        chordArray.append(chord.scaleArray[11])
        chordArray.append(chord.scaleArray[7])
        chordArray.append(chord.scaleArray[2])
        chordArray.append(chord.scaleArray[9])
        chordArray.append(chord.scaleArray[4])
        
        stringArray.append(chord.scaleArray[4])
        stringArray.append(chord.scaleArray[11])
        stringArray.append(chord.scaleArray[7])
        stringArray.append(chord.scaleArray[2])
        stringArray.append(chord.scaleArray[9])
        stringArray.append(chord.scaleArray[4])

    }
   
    
    func grabBase() -> String {
        
        for index in ((0..<stringsEnabled.count).reversed()) {
            if stringsEnabled[index] {
                return chordArray[index]!
            }
        }
        return ""
        
    }
     
    func setBaseIndex() -> Int {
        let index = chord.scaleArray.firstIndex { (note) -> Bool in

            if note == grabBase() {
                return true
            } else {
                return false
            }
        }
        return index ?? 0
    }
    
    func setChord() -> String {
        let baseIndex = setBaseIndex()
        var noteIndex:[Int] = []
        var fromBaseIndex:[Int] = []
        
        for index in 0..<Constants.stringCount {
            if stringsEnabled[index] {
                for j in 0..<chord.scaleArray.count {
                    if chordArray[index] == chord.scaleArray[j] {
                        noteIndex.append(j)
                    }
                }
            } else {
                continue
            }
            
        }

        for eachNoteI in noteIndex {
            if eachNoteI == baseIndex {
                fromBaseIndex.append(eachNoteI - baseIndex)
            } else if eachNoteI < baseIndex {
                fromBaseIndex.append(eachNoteI + chord.scaleArray.count - baseIndex)
            } else {
                fromBaseIndex.append(eachNoteI-baseIndex)
            }
        }
        print (fromBaseIndex)
        if [0, 4, 7, 11].allSatisfy(fromBaseIndex.contains) {
            return "Major 7"
        } else if [0, 4, 7, 10].allSatisfy(fromBaseIndex.contains) {
            return "Dominant 7"
        } else if [0, 3, 7, 10].allSatisfy(fromBaseIndex.contains) {
            return "Minor 7"
        } else if [0, 3, 6, 10].allSatisfy(fromBaseIndex.contains) {
            return "Minor 7 flat 5"
        } else if [0, 3, 6, 9].allSatisfy(fromBaseIndex.contains) {
            return "Diminished 7"
        } else if [0, 2, 7].allSatisfy(fromBaseIndex.contains) {
            return "Suspended 2"
        } else if [0, 5, 7].allSatisfy(fromBaseIndex.contains) {
            return "Suspended 4"
        } else if [0, 3, 6].allSatisfy(fromBaseIndex.contains) {
            return "Diminished"
        } else if [0, 3, 7].allSatisfy(fromBaseIndex.contains) {
            return "Minor"
        } else if [0, 4, 8].allSatisfy(fromBaseIndex.contains) {
            return "Augmented"
        } else if [0, 4, 7].allSatisfy(fromBaseIndex.contains) {
            return "Major"
        } else {
            return "Base Chord undefined"
        }
    }
    
    func getChord() {
        displayChord = grabBase() + " " + setChord()
    }
    
    func newButtonPressed(fretNum: Int, stringIndex: Int) {
        for fret in 0..<Constants.fretCount {
            if fret == fretNum {
                pressedFretIndex[stringIndex] = fretNum + 1 //in real life fret number start from 1
                chordArray[stringIndex] = updateNote(PressedFretIndex: pressedFretIndex[stringIndex], CurrentNote: stringArray[stringIndex]!)
                continue
            } else {
                fretPressed[fret][stringIndex] = false
            }
        }
    }
    
    //userChord.chordArray[index] = userChord.updateNote(PressedFretIndex: userChord.pressedFretIndex[index], CurrentNote: userChord.chordArray[index]!)
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
