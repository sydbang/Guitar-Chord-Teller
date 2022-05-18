//
//  TopTabView.swift
//  ChordTeller
//
//  Created by Sunghee Bang on 2022-05-17.
//

import SwiftUI

struct TopTabView: View {
    var body: some View {
        TabView {
            
            GuitarHomeView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Fret")
                    }
                }
            
            RecentChordListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("History")
                    }
                }
            SettingsView()
                .tabItem {
                    VStack {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                }
        }
    }
}

struct TopTabView_Previews: PreviewProvider {
    static var previews: some View {
        TopTabView()
    }
}
