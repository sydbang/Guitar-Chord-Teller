//
//  ChordTellerView.swift
//  GuitarChordTeller
//
//  Created by Sunghee Bang on 2021-11-10.
//

import SwiftUI

struct ChordTellerView: View {
    
    @EnvironmentObject var userChord: GuitarChordModel
    var body: some View {
        
        VStack {
            
            // Display the chord
            Text(userChord.displayChord)
                .font(.system(size: 40))
                .lineLimit(2)
                .padding(.horizontal, 20)
            
            SwiftUIBannerAd(adPosition: .bottom, adUnitId: "ca-app-pub-5621465422465010/8515892106")
            //for testing ads "ca-app-pub-3940256099942544/2934735716")
        }
       
    }
}

struct ChordTellerView_Previews: PreviewProvider {
    static var previews: some View {
        ChordTellerView()
    }
}
