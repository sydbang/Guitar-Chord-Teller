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
    
    @FetchRequest(sortDescriptors: []) var chords: FetchedResults<Chord>
    
    var body: some View {
        VStack {
            List {
                ForEach(chords, id: \.self) { chord in
                    Text(chord.name)
                }
            }
        }
    }
}

struct RecentChordListView_Previews: PreviewProvider {
    static var previews: some View {
        RecentChordListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
