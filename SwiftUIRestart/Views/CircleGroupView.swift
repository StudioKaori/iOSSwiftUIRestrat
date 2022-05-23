//
//  CircleGroupView.swift
//  SwiftUIRestart
//
//  Created by Kaori Persson on 2022-05-23.
//

import SwiftUI

struct CircleGroupView: View {
    
    // MARK: property
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    
    // MARK: body
    var body: some View {
        ZStack{
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity),lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
            
        } //: zstack
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
        }
    }
}
