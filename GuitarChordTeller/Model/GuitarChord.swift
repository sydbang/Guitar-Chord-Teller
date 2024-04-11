//
//  GuitarChord.swift
//  GuitarChordTeller
//
//  Created by Sunghee Bang on 2021-09-29.
//

import Foundation

struct GuitarChord {
    
    var scaleArray = ["C","C#","D","D#","E","F","F#","G","G#","A","A#","B"]
    
    func grabNoteOnC(index: Int) -> String {
        var i = index
        while  i > scaleArray.count-1 {
            i = i % scaleArray.count
        }
        return scaleArray[i]
    }
}
