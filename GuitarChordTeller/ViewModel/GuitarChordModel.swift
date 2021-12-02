//
//  GuitarChordModel.swift
//  GuitarChordTeller
//
//  Created by Sunghee Bang on 2021-09-29.
//

import Foundation

class GuitarChordModel: ObservableObject {
    
    @Published var showHowToView = true
    @Published var displayChord = ""
    
    @Published var stringsEnabled = [true,true,true,true,true,true]
    
    @Published var fretPressed = Array(repeating: Array(repeating: false, count: Constants.stringCount), count: Constants.fretCount)
    
    @Published var stringArray: [String?] = []
    @Published var chordArray: [String?] = []
    
    var chord = GuitarChord()
    
    @Published var pressedFretIndex: [Int] = [0,0,0,0,0,0]
    
    @Published var stringScaleIndex: [Int] {
        didSet {
            UserDefaults.standard.set(stringScaleIndex, forKey: "stringScaleIndex")
            
        }
    }

    
    init() {
        
        self.stringScaleIndex = UserDefaults.standard.object(forKey: "stringScaleIndex") as? [Int] ?? [4, 11, 7, 2, 9, 4]
        
        setChordArrray()
        setStringArray()
    }
   
    func setChordArrray() {
        chordArray = []
        for index in stringScaleIndex {
            chordArray.append(chord.scaleArray[index])
        }
    }
    
    func setStringArray() {
        stringArray = []
        for index in stringScaleIndex {
            stringArray.append(chord.scaleArray[index])
        }
        
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
        var baseIndex = setBaseIndex()
        var noteIndex:[Int] = []
        var fromBaseIndex:[Int] = []
        var stringToReturn = ""
        
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
        
        for z in 0..<noteIndex.count {
            fromBaseIndex = getIndexArrayFromBase(noteIndex: noteIndex, baseIndex: baseIndex)
            print (fromBaseIndex)
            stringToReturn = checkChord(fromBaseIndex: fromBaseIndex)
            if !stringToReturn.contains("Base / ") {
                if z != 0 {
                    print(z)
                    let realRoot = chord.scaleArray[noteIndex[z]]
                    stringToReturn = "\(realRoot) \(stringToReturn) / Base"
                    break
                } else {
                    break
                }
            } else {
                baseIndex = setNewBaseIndex(noteIndex: noteIndex, currentIndexOfBase: z)
                if baseIndex == -1 {
                    return "Base / undefined Chord"
                }
            }
        }
        
        return stringToReturn
    }
    
    func setNewBaseIndex(noteIndex: [Int], currentIndexOfBase: Int) -> Int {
        // Grabs note index that has already been written from func setChord
        if currentIndexOfBase < (noteIndex.count-1) {
            return noteIndex[currentIndexOfBase+1]
        }
        else {
            return -1
        }
    }
    
    func getIndexArrayFromBase(noteIndex: [Int], baseIndex: Int) -> [Int] {
        
        var fromBaseIndex: [Int] = []
        
        for eachNoteI in noteIndex {
            if eachNoteI == baseIndex {
                fromBaseIndex.append(eachNoteI - baseIndex)
            } else if eachNoteI < baseIndex {
                fromBaseIndex.append(eachNoteI + chord.scaleArray.count - baseIndex)
            } else {
                fromBaseIndex.append(eachNoteI-baseIndex)
            }
        }
        return fromBaseIndex
    }
    
    func checkChord(fromBaseIndex: [Int]) -> String {
        if [0, 3, 7, 10, 5].allSatisfy(fromBaseIndex.contains) {
            return "Minor 11"
        } else
        if [0, 4, 7, 9, 2].allSatisfy(fromBaseIndex.contains) {
            return "Major 6/9"
        } else if [0, 4, 7, 11, 6].allSatisfy(fromBaseIndex.contains) {
            return "Major 7 #11"
        } else if [0, 4, 7, 11, 9].allSatisfy(fromBaseIndex.contains) {
            return "Major 13"
        } else if [0, 4, 7, 11, 5].allSatisfy(fromBaseIndex.contains) {
            return "Major 11"
        } else if [0, 4, 7, 10, 2, 5].allSatisfy(fromBaseIndex.contains) {
            return "Dominant 13"
        } else if [0, 4, 7, 10, 2, 3].allSatisfy(fromBaseIndex.contains) {
            return "Dominant 11"
        } else if [0, 4, 7, 10, 2].allSatisfy(fromBaseIndex.contains) {
            return "Dominant 9"
        } else if [0, 4, 7, 2].allSatisfy(fromBaseIndex.contains) {
            return "Major 9"
        } else if [0, 4, 7, 11].allSatisfy(fromBaseIndex.contains) {
            return "Major 7"
        } else if [0, 4, 7, 10].allSatisfy(fromBaseIndex.contains) {
            return "Dominant 7"
        } else if [0, 3, 7, 10].allSatisfy(fromBaseIndex.contains) {
            return "Minor 7"
        } else if [0, 3, 6, 10].allSatisfy(fromBaseIndex.contains) {
            return "Minor 7 flat 5"
        } else if [0, 3, 6, 9].allSatisfy(fromBaseIndex.contains) {
            return "Diminished 7"
        } else if [0, 4, 7, 5].allSatisfy(fromBaseIndex.contains) {
            return "Major add 4"
        } else if [0, 4, 7, 9].allSatisfy(fromBaseIndex.contains) {
            return "Major add 6"
        } else if [0, 2, 4, 7].allSatisfy(fromBaseIndex.contains) {
            return "Suspended 2"
        } else if [0, 4, 7].allSatisfy(fromBaseIndex.contains) {
            return "Major"
        } else if [0, 5, 7].allSatisfy(fromBaseIndex.contains) {
            return "Suspended 4"
        } else if [0, 3, 6].allSatisfy(fromBaseIndex.contains) {
            return "Diminished"
        } else if [0, 3, 7].allSatisfy(fromBaseIndex.contains) {
            return "Minor"
        } else if [0, 4, 8].allSatisfy(fromBaseIndex.contains) {
            return "Augmented"
        } else if [0, 4, 6].allSatisfy(fromBaseIndex.contains) {
            return "Major flat 5"
        } else if [0, 2, 7].allSatisfy(fromBaseIndex.contains) {
            return "Suspended 2"
        } else {
            return "Base / "
        }
    }
    
    func getChord() {
        let baseInfo = grabBase()
        let chordInfo = setChord()
        
        if chordInfo.contains("Base") && !chordInfo.contains("undefined"){
            displayChord = chordInfo + " " + baseInfo
        } else {
            displayChord = baseInfo + " " + chordInfo
        }
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
    
    func clearAll() {
        for fretIndex in 0..<Constants.fretCount {
            for stringIndex in 0..<Constants.stringCount {
                fretPressed[fretIndex][stringIndex] = false
                stringsEnabled[stringIndex] = true
                pressedFretIndex[stringIndex] = 0
                setChordArrray()
            }
        }
        getChord()
    }
    
    
}
