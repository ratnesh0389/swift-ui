//
//  ModelData.swift
//  AppleSwiftUI
//
//  Created by Ratnesh Singh on 02/04/23.
//

import Foundation

func load<T: Decodable>(_ fileName: String) -> T {
    let data: Data
    
    guard let fileName = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        /// Unconditionally prints a given message and stops execution.
        fatalError("Couldn't find \(fileName) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: fileName)
    } catch {
        fatalError("Couldn't load \(fileName) from main bundle:\n\(error)")
    }
    
    do {
        let docoder = JSONDecoder()
        return try docoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(fileName) as \(T.self):\n\(error)")
    }
}
