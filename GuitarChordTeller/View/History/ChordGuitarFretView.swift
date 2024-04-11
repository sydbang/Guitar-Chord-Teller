//
//  ChordGuitarFretView.swift
//  ChordTeller
//
//  Created by Sunghee Bang on 2024-04-11.
//

import SwiftUI

struct ChordGuitarFretView: View {
    @EnvironmentObject var userDefaults:UserSettings
    
    var stringScaleIndex: [Int]
    var displayChord: String
    var fretPressedIndex: [Int]
    var stringsEnabled: [Bool]
    var capoLocation: Int?
    
    var tuning: String {
        if stringScaleIndex == [4, 11, 7, 2, 9, 4] {
            return "Standard tuning"
        } else {
            return "Not standard tuning"
        }
    }
    
    var body: some View {
        VStack {
            GeometryReader { geo in
                VStack {
                    HStack{
                        Text(tuning)
                            .font(.system(size: 13))
                        Spacer()
                    }
                    .padding(.horizontal, geo.size.width/14)
                    
                    // Display the chord
                    Text(displayChord)
                        .font(.system(size: 38))
                        .lineLimit(2)
                        .padding(10)
                    
                    ChordGuitarNoteView(stringsEnabled: stringsEnabled, pressedFretIndex: fretPressedIndex, stringScaleIndex: stringScaleIndex)
                        .padding(.horizontal, geo.size.width/14)
                    
                    Divider()
                        .padding()
                    
                    ScrollView {
                        ForEach(0 ..< Constants.fretCount, id: \.self) { i in
                            Spacer()
                            ZStack {
                                
                                GuitarLineView()
                                    .padding(.horizontal, geo.size.width/7)
                                HStack (alignment: .center){
                                    
                                    ForEach(userDefaults.stringsIndex, id: \.self) { j in
                                        Spacer()
                                        GuitarFretButton(
                                            pressed: false, // TODO: need calc
                                            enabled: stringsEnabled[j],
                                            fret: i,
                                            string: j,
                                            toggleFunction: {}
                                        )
                                        Spacer()
                                    }
                                }
                                .padding(.vertical, CGFloat(Constants.fretCount - i)*2 + 1)
                                .padding(.horizontal, geo.size.width/14)
                                
                                GuitarDotView(fretNum: i)
                                CapoView(fretNum: i, capoLocation: capoLocation)
                            }
                        }
                    }
                    .onAppear(perform: userDefaults.updateStringIndex)
                }
                .padding(.top, 10)
            }
            
            SwiftUIBannerAd(adPosition: .bottom, adUnitId: "ca-app-pub-5621465422465010/8515892106")
                .frame(maxHeight: 60)
            //for testing ads "ca-app-pub-3940256099942544/2934735716")
        }
        .navigationBarTitleDisplayMode (.inline)
    }
}

#Preview {
    ChordGuitarFretView(stringScaleIndex: [], displayChord: "C Major", fretPressedIndex: [], stringsEnabled: [], capoLocation: 1)
}
