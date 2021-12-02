//
//  SettingsView.swift
//  ChordTeller
//
//  Created by Sunghee Bang on 2021-12-02.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var userChord:GuitarChordModel
    @EnvironmentObject var userDefault: UserSettings
    
    @State var showTuner = false
    
    var body: some View {
        
        
        VStack {
            //TODo leftie
            Toggle(isOn: $userDefault.leftHanded, label: {
                Text("Left Handed View")
                    .foregroundColor(Constants.blue)
            })
            .toggleStyle(SwitchToggleStyle(tint: Constants.blue))
            .padding(20)
            
            HStack {
                Text("Tuning")
                Spacer()
                Button(action: {
                    showTuner.toggle()
                }) {
                    
                    ForEach (0..<userChord.stringArray.count) { index in
                        Text(userChord.stringArray[index] ?? "")
                    }
                }
                .sheet(isPresented: $showTuner) {
                    SettingTunerView()
                        .onDisappear(perform: {
                            userChord.clearAll()
                            userChord.setStringArray()
                            userChord.setChordArrray()
                            userChord.getChord()
                        })
                }
                
            }
            .padding(.horizontal, 20)
            
            Spacer()
            
            SwiftUIBannerAd(adPosition: .bottom, adUnitId: "ca-app-pub-5621465422465010/8515892106")
                .frame(height:50)
            //for testing ads "ca-app-pub-3940256099942544/2934735716")
        }
        .navigationBarTitle("Settings",displayMode: .inline)
        
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
