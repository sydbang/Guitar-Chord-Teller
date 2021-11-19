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
                GeometryReader { geo in
                    
                    VStack {
                        GuitarNoteView()
                            .padding(.horizontal, geo.size.width/14)

                        Divider()
                            .padding()
                        
                        ScrollView {
                            ForEach(0 ..< Constants.fretCount) { i in
                                Spacer()
                                ZStack {
                                    GuitarLineView()
                                        .padding(.horizontal, geo.size.width/7)
                                    HStack (alignment: .center){
                                        
                                        ForEach((0..<Constants.stringCount).reversed(), id: \.self) { j in
                                            Spacer()
                                            GuitarFretButton(
                                                pressed: userChord.fretPressed[i][j] ,
                                                enabled: userChord.stringsEnabled[j],
                                                fret: i,
                                                string: j,
                                                toggleFunction: {userChord.fretPressed[i][j].toggle()}
                                            )
                                            Spacer()
                                                
                                        }
                                        
                                    }
                                    .padding(.vertical, CGFloat(Constants.fretCount - i)*2 + 1)
                                    .padding(.horizontal, geo.size.width/14)
                                    
                                }
  
                            }
                        }
                    }
                    .padding(.top, 10)
                }
                
                NavigationLink(
                    destination: ChordTellerView()
                        .onAppear(perform: userChord.getChord),
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
            .navigationBarHidden(true)
            
        }
        
    }
    
    
}

struct GuitarFretView_Previews: PreviewProvider {
    static var previews: some View {
        GuitarFretView()
    }
}
