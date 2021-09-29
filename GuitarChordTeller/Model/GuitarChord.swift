//
//  GuitarChord.swift
//  GuitarChordTeller
//
//  Created by Sunghee Bang on 2021-09-29.
//

import Foundation

struct GuitarChord {
    
    var firstString:String?
    var secondString:String?
    var thirdString:String?
    var fourthString:String?
    var fifthString:String?
    var sixthString:String?
    
    func grabBase() -> String {
        if sixthString != nil {
            return sixthString!
        } else if fifthString != nil {
            return fifthString!
        } else if fourthString != nil {
            return fourthString!
        } else if thirdString != nil {
            return thirdString!
        } else if secondString != nil {
            return secondString!
        } else if firstString != nil {
            return firstString!
        } else { return "error"}
        
    }
    
}
