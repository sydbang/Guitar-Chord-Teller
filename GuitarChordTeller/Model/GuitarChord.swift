//
//  GuitarChord.swift
//  GuitarChordTeller
//
//  Created by Sunghee Bang on 2021-09-29.
//

import Foundation

struct GuitarChord {
    
    var chordArray: [String?] = []
    
    var fretPressed = Array(repeating: Array(repeating: false, count: Constants.stringCount), count: Constants.fretCount)
}
