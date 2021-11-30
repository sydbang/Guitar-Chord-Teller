//
//  HowToView.swift
//  GuitarChordTeller
//
//  Created by Sunghee Bang on 2021-11-08.
//

import SwiftUI

struct HowToView: View {
    
    @EnvironmentObject var model: GuitarChordModel
    @EnvironmentObject var userSettings: UserSettings
    
    @State private var tabSelection = 0
    
    var body: some View {
        VStack (spacing: 20) {
            TabView (selection: $tabSelection) {
                // First tab
                VStack {
                    Text("Welcome to ChordTeller!")
                        .bold()
                        .font(.title)
                    Text("Chord Teller will help you find 6 string guitar chords!")
                }
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.white)
                .tag(0)
                
                // Second Tab
                VStack (spacing: 20) {
                    Text("You simply place your fingers on to the correct area by scrolling and tapping on the guitar fret.")
                        .bold()
                        .font(.title)
                    Text("We will tell you what chord you are holding when you press the find chord button!")
                }
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.white)
                .tag(1)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            // Button
            Button {
                // Detect which tab it is
                if tabSelection == 0 {
                    tabSelection = 1
                } else {
                    //UserDefaults.standard.set(false, forKey: "isFirstTimeUser")
                    userSettings.firstTimeUser = false
                }
            } label: {
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 48)
                        .cornerRadius(10)
                    Text(tabSelection == 0 ? "Next" : "Begin!")
                        .bold()
                        .padding()
                }
            }
            .accentColor(tabSelection == 0 ? Constants.blue : Constants.turquoise)
            .padding()
            
            Spacer()
        }
        .background(tabSelection == 0 ? Constants.blue : Constants.turquoise)
        .ignoresSafeArea()
    }
}

struct HowToView_Previews: PreviewProvider {
    static var previews: some View {
        HowToView()
    }
}
