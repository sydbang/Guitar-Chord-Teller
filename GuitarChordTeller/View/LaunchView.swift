//
//  LaunchView.swift
//  GuitarChordTeller
//
//  Created by Sunghee Bang on 2021-11-08.
//

import SwiftUI

struct LaunchView: View {
    
    @EnvironmentObject var model: GuitarChordModel
    
    var body: some View {
        if model.firstTimeUser == true {
            HowToView()
                
        } else {
            GuitarFretView()
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
