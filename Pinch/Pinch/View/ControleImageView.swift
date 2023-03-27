//
//  ControleImageView.swift
//  Pinch
//
//  Created by Ratnesh Singh on 27/03/23.
//

import SwiftUI

struct ControleImageView: View {
    let icon: String
    
    var body: some View {
        Image(systemName: icon)
           .font(.system(size: 36))
    }
}

struct ControleImageView_Previews: PreviewProvider {
    static var previews: some View {
        ControleImageView(icon: "minus.magnifyingglass")
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
