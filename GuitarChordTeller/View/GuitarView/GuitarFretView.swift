//
//  ContentView.swift
//  GuitarChordTeller
//
//  Created by Sunghee Bang on 2021-09-13.
//

import SwiftUI


struct GuitarFretView: View {
    
    @EnvironmentObject var userChord:GuitarChordModel
    
    var body: some View {
        
        NavigationView {
            VStack {
               
                GuitarNoteView()
                GeometryReader { geo in
                    ScrollView {
                        ForEach(0..<Constants.fretCount) { i in
                            HStack (alignment: .center){
                                Spacer()
                                ForEach((0..<Constants.stringCount).reversed(), id: \.self) { j in
                                    
                                    GuitarFretButton(
                                        pressed: userChord.fretPressed[i][j] ,
                                        enabled: userChord.stringsEnabled[j],
                                        fret: i,
                                        string: j,
                                        toggleFunction: {userChord.fretPressed[i][j].toggle()}
                                    )
                                        .padding(.horizontal, geo.size.width/26)
                                }
                                Spacer()
                            }
                            .padding(.bottom, CGFloat(Constants.fretCount - i)*3 + 1)
                            .padding(.horizontal)
                            
                        }
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
