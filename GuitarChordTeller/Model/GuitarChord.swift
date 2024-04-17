//
//  GuitarChord.swift
//  GuitarChordTeller
//
//  Created by Sunghee Bang on 2021-09-29.
//

import Foundation

struct GuitarChord {
    
    var scaleArray = ["C","C#","D","D#","E","F","F#","G","G#","A","A#","B"]
    
    var standardTuning = [4, 11, 7, 2, 9, 4] //EADGBE
    var dropDTuning = [4, 11, 7, 2, 9, 2] //DADGBE
    var dropCTuning = [2, 9, 5, 0, 7, 0] //CGCFAD
    var bStandardTuning = [11, 6, 4, 9, 4, 11] //BEADF#B
    var openDTuning = [2, 9, 6, 2, 9, 2] //DADF#AD
    var openGTuning = [2, 11, 7, 2, 7, 2] //DGDGBD
    var openCTuning = [4, 0, 7, 0, 7, 0] //CGCGCE
    var dadgadTuning = [2, 9, 7, 2, 9, 2] //DADGAD
    var openETuning = [4, 11, 8, 4, 11, 4] //EBEG#BE
}
