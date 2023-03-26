//
//  CircleImageView.swift
//  AppleSwiftUI
//
//  Created by Ratnesh Singh on 26/03/23.
//

import SwiftUI

struct CircleImageView: View {
    var body: some View {
        Image("earth_day")
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .overlay(Circle().stroke(.white, lineWidth: 5))
            .shadow(radius: 7)
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView()
    }
}
