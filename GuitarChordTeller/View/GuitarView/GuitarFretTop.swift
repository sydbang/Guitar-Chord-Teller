//
//  GuitarSettingView.swift
//  ChordTeller
//
//  Created by Sunghee Bang on 2021-11-22.
//

import SwiftUI

struct GuitarFretTop: View {
    
    @EnvironmentObject var userChord:GuitarChordModel
    @Environment(\.managedObjectContext) private var viewContext
    
    
    var body: some View {
        HStack {
            Button {
                userChord.clearAll()
            } label: {
                Text("Clear All")
            }
            Spacer()
            
            if userChord.displayChord != "" {
                Button(action: addChord) {
                    HStack {
                        Text("Save")
                        Image(systemName: "square.and.arrow.down")
                    }
                }
            }
        }
    }
    private func addChord() {
        let chord = Chord(context: viewContext)
        chord.name = userChord.displayChord
        chord.date = NSDate() as Date
        chord.stringScaleIndex = userChord.stringScaleIndex
        chord.stringsEnabled = userChord.stringsEnabled as NSObject
        chord.fretPressedIndex = userChord.pressedFretIndex
        if let capoLocation = userChord.capoOnFret {
            chord.capoLocation = capoLocation
        }
        do {
            try viewContext.save()
        } catch {
            print("Error when saving chord")
        }
    }
}

struct GuitarSettingView_Previews: PreviewProvider {
    static var previews: some View {
        GuitarFretTop()
    }
}
