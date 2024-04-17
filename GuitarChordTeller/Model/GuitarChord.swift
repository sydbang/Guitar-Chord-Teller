//
//  GuitarChord.swift
//  GuitarChordTeller
//
//  Created by Sunghee Bang on 2021-09-29.
//

import Foundation

struct GuitarChord {
    
    var scaleArray = ["C","C#","D","D#","E","F","F#","G","G#","A","A#","B"]
    
    var tunings: [[Int]: String] = [
        [4, 11, 7, 2, 9, 4]: "Standard tuning",
        [2, 9, 5, 0, 7, 0]: "Drop C tuning",
        [11, 6, 4, 9, 4, 11]: "B Standard tuning",
        [2, 9, 6, 2, 9, 2]: "Open D tuning",
        [2, 11, 7, 2, 7, 2]: "Open G tuning",
        [4, 0, 7, 0, 7, 0]: "Open C tuning",
        [2, 9, 7, 2, 9, 2]: "DAD-GAD tuning",
        [4, 11, 8, 4, 11, 4]: "Open E tuning"
    ]
}
