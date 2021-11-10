//
//  ContentView.swift
//  GuitarChordTeller
//
//  Created by Sunghee Bang on 2021-09-13.
//

import SwiftUI

let fretCount = 24

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
                    ForEach(0..<fretCount) { index in
                        GuitarFretRow()
                    }
                }
                NavigationLink(
                    destination: ChordTellerView(),
                    label: {
                        ZStack {
                            Rectangle()
                                .foregroundColor(Constants.blue)
                                .frame(height: 48)
                                .cornerRadius(10)
                            Text("Find Chord!")
                                .bold()
                                .padding()
                                .accentColor(.white)
                        }
                        .padding()
                    }
                )
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
