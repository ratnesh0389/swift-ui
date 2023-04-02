//
//  Landmark.swift
//  AppleSwiftUI
//
//  Created by Ratnesh Singh on 02/04/23.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Codable, Hashable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    //You make the property private because users of the Landmarks structure care only about the image itself.
    private var imageName: String
    
    var image: Image{
        Image(imageName)
    }
    
    //Add co-ordinate property to image.
    
    private var coordinate: Coordinates
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinate.latitude,
            longitude: coordinate.longitude
        )
    }
    
    struct Coordinates: Hashable, Codable {
        var longitude: Double
        var latitude: Double
    }
}
