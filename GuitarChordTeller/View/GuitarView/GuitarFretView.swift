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
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                GuitarNoteView()
                
                ScrollView {
                    ForEach(0..<fretCount) { index in
                        GuitarFretRow()
                            .padding(.bottom, CGFloat(fretCount - index)*4 + 1)
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
    
   
}

struct GuitarFretView_Previews: PreviewProvider {
    static var previews: some View {
        GuitarFretView()
    }
}
