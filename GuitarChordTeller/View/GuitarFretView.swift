//
//  ContentView.swift
//  GuitarChordTeller
//
//  Created by Sunghee Bang on 2021-09-13.
//

import SwiftUI

struct GuitarFretView: View {
    
    var chord = GuitarChord(firstString: "E", secondString: "B", thirdString: "G", fourthString: "D", fifthString: "A", sixthString: "E")
    
    var scaleArray = ["C","C#","D","D#","E","F","F#","G","G#","A","A#","B","B#","C","C#","D","D#","E","F","F#","G","G#","A","A#","B","B#"]
    
    var body: some View {
        
        NavigationView {
            HStack (spacing: 30){
                Text(chord.sixthString!)
                Text(chord.fifthString!)
                Text(chord.fourthString!)
                Text(chord.thirdString!)
                Text(chord.secondString!)
                Text(chord.firstString!)
            }
        }
        
    }
    
//    func setBaseIndex() {
//        let index = array.firstIndex { (chord.grabBase()) -> Bool in
//
//            if array[index] == chord.grabBase() {
//                return true
//            } else {
//                return false
//            }
//
//        }
//    }
}

struct GuitarFretView_Previews: PreviewProvider {
    static var previews: some View {
        GuitarFretView()
    }
}
