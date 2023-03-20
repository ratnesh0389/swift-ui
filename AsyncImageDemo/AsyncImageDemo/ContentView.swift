//
//  ContentView.swift
//  AsyncImageDemo
//
//  Created by Ratnesh Singh on 21/03/23.
//

import SwiftUI

extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifer() -> some View {
        self
            .imageModifier()
            .frame(maxWidth: 300)
            .foregroundColor(.red)
            .opacity(0.5)
    }
}

struct ContentView: View {
    private let imageUrl: String = "https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg"
    var body: some View {
        // MARK: 1. Basic
        
        // AsyncImage(url: URL(string: imageUrl))
        
        // MARK: 2. Scaling
        
        // AsyncImage(url: URL(string: imageUrl), scale: 1.0)
        
        // MARK: 3. Placeholder
       /* AsyncImage(url: URL(string: imageUrl)) { image in
            image.imageModifier()
        } placeholder: {
            Image(systemName: "photo.circle.fill")
                .iconModifer()
        }
        .padding(40)
       */
        
        // MARK: 4. Phase
        
        /*
        AsyncImage(url: URL(string: imageUrl)) { phase in
            // SUCCESS: The image successfully load.
            // FAILURE: The image load to failed to load with error.
            // EMPTY: NO image is loaded.
            
            if let image = phase.image {
                image.imageModifier()
            } else if phase.error != nil {
                Image(systemName: "ant.circle.fill").iconModifer()
            } else {
                Image(systemName: "photo.circle.fill").iconModifer()
            }
        }
        .padding(40)
        */
        
        //MARK: - 5. Animation
        AsyncImage(url: URL(string: imageUrl), transaction: Transaction(animation: .interactiveSpring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
            switch phase {
            case .success(let image):
                image.imageModifier()
                // .transition(.move(edge: .bottom))
                // .transition(.slide) // Slide image from left to right.
                    .transition(.scale)
            case .failure(_):
                Image(systemName: "ant.circle.fill").imageModifier()
            case .empty:
                Image(systemName: "phot.cicle.fill").imageModifier()
            @unknown default:
                ProgressView()
            }
        }
        .padding(40.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
