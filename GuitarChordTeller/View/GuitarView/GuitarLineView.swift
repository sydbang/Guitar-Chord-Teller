//
//  GuitarLineView.swift
//  GuitarChordTeller
//
//  Created by Sunghee Bang on 2021-11-18.
//

import SwiftUI

struct GuitarLineView: View {
    var body: some View {
        GeometryReader { geo in
            Path({ path in
                
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: geo.size.width, y: 0))
                path.addLine(to: CGPoint(x: geo.size.width, y: geo.size.height*2))
                path.move(to: CGPoint(x: geo.size.width, y: geo.size.height))
                path.addLine(to: CGPoint(x: 0, y: geo.size.height))
                path.move(to: CGPoint(x: 0, y: geo.size.height*2))
                path.addLine(to: CGPoint(x: 0, y: 0))
                
                path.move(to: CGPoint(x: geo.size.width/5, y: 0))
                path.addLine(to: CGPoint(x: geo.size.width/5, y: geo.size.height*2))
                
                path.move(to: CGPoint(x: geo.size.width*2/5, y: 0))
                path.addLine(to: CGPoint(x: geo.size.width*2/5, y: geo.size.height*2))
                
                path.move(to: CGPoint(x: geo.size.width*3/5, y: 0))
                path.addLine(to: CGPoint(x: geo.size.width*3/5, y: geo.size.height*2))
                
                path.move(to: CGPoint(x: geo.size.width*4/5, y: 0))
                path.addLine(to: CGPoint(x: geo.size.width*4/5, y: geo.size.height*2))
            })
            .stroke(Color.black, style: StrokeStyle(lineWidth: 2))
        }
    }
}

struct GuitarLineView_Previews: PreviewProvider {
    static var previews: some View {
        GuitarLineView()
    }
}
