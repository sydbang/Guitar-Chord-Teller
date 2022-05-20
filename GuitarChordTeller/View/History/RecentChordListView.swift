//
//  RecentChordListView.swift
//  ChordTeller
//
//  Created by Sunghee Bang on 2022-05-17.
//

import SwiftUI
import CoreData

struct RecentChordListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var userChord:GuitarChordModel
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)]) var chords: FetchedResults<Chord>
    
    var body: some View {
        NavigationView {
            VStack {
                Text("History")
                    .font(.title)
                List {
                    ForEach(chords, id: \.self) { chord in
                        
                        HStack {
                            NavigationLink (destination:
                                                GuitarFretView()
                                                .onAppear() {
                                                    DispatchQueue.main.async {
                                                        userChord.getFretMatrix(pressedFretIndex: chord.fretPressedIndex)
                                                        userChord.stringScaleIndex = chord.stringScaleIndex
                                                        userChord.setStringArray()
                                                        userChord.displayChord = chord.name
                                                        userChord.stringsEnabled = chord.stringsEnabled as! [Bool]
                                                        
                                                    }
                                                },
                                            label: {
                                                Text(chord.name)
                                            })
                            Spacer()
                            
                            Image(systemName: "xmark.circle")
                                .onTapGesture {
                                    viewContext.delete(chord)
                                    try! viewContext.save()
                                }
                        }
                    }
                }
                
                Spacer()
                
                SwiftUIBannerAd(adPosition: .bottom, adUnitId: "ca-app-pub-5621465422465010/8515892106")
                    .frame(height:50)
            }
            .navigationBarHidden(true)
        }
    }
}

struct RecentChordListView_Previews: PreviewProvider {
    static var previews: some View {
        RecentChordListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
