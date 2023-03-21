//
//  CircleGroupView.swift
//  Restart
//
//  Created by Ratnesh Singh on 21/03/23.
//

import SwiftUI

struct CircleGroupView: View {
    //MARK: -Property
    
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    
    //MARK: -body
    var body: some View {
        ZStack {
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity),
                lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        } //: ZSTACK
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
