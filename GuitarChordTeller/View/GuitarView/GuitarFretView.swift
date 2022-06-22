//
//  ContentView.swift
//  GuitarChordTeller
//
//  Created by Sunghee Bang on 2021-09-13.
//

import SwiftUI


struct GuitarFretView: View {
    
    @EnvironmentObject var userChord:GuitarChordModel
    @EnvironmentObject var userDefaults:UserSettings
    
    var tuning: String {
        if userChord.stringScaleIndex == [4, 11, 7, 2, 9, 4] {
            return "Standard tuning"
        } else {
            return "Not standard tuning"
        }
    }
    var body: some View {
        
        VStack {
            GeometryReader { geo in
                
                VStack {
                    
                    Text(tuning)
                        .font(.system(size: 13))
                    
                    // Display the chord
                    Text(userChord.displayChord)
                        .font(.system(size: 38))
                        .lineLimit(2)
                        .padding(10)
                    
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
                                    
                                    ForEach(userDefaults.stringsIndex, id: \.self) { j in
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
                                
                                GuitarDotView(fretNum: i)
                            }
                            
                        }
                    }
                    .onAppear(perform: userDefaults.updateStringIndex)
                }
                .padding(.top, 10)
            }
            
            SwiftUIBannerAd(adPosition: .bottom, adUnitId: "ca-app-pub-5621465422465010/8515892106")
            //for testing ads "ca-app-pub-3940256099942544/2934735716")
        }
        .navigationBarTitleDisplayMode (.inline)
    }
}

struct GuitarFretView_Previews: PreviewProvider {
    static var previews: some View {
        GuitarFretView()
    }
}
