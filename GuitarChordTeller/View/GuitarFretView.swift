//
//  ContentView.swift
//  GuitarChordTeller
//
//  Created by Sunghee Bang on 2021-09-13.
//

import SwiftUI

struct GuitarFretView: View {
    
    @EnvironmentObject var userChord:GuitarChordModel
    
    var scaleArray = ["C","C#","D","D#","E","F","F#","G","G#","A","A#","B","B#","C","C#","D","D#","E","F","F#","G","G#","A","A#","B","B#"]
    
    var body: some View {
        
        NavigationView {
            VStack {
                HStack (spacing: 30){
                    Text(userChord.chord.sixthString!)
                    Text(userChord.chord.fifthString!)
                    Text(userChord.chord.fourthString!)
                    Text(userChord.chord.thirdString!)
                    Text(userChord.chord.secondString!)
                    Text(userChord.chord.firstString!)
                }
                ScrollView {
                    Text(String(userChord.baseIndex))
                }
                NavigationLink(
                    destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
                    label: {
                        /*@START_MENU_TOKEN@*/Text("Navigate")/*@END_MENU_TOKEN@*/
                    })
            }
            
        }
        
    }
    
    func setBaseIndex() {
        let index = scaleArray.firstIndex { (note) -> Bool in

            if note == userChord.grabBase() {
                return true
            } else {
                return false
            }
        }
        userChord.baseIndex = index ?? 0
    }
}

struct GuitarFretView_Previews: PreviewProvider {
    static var previews: some View {
        GuitarFretView()
    }
}
