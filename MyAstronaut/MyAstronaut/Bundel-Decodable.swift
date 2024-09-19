//
//  Bundel-Decodable.swift
//  MyAstronaut
//
//  Created by Mantosh Kumar on 18/09/24.
//

import SwiftUI

extension Bundle {
    
//    func decode(_ file:  String) -> [String: Astronaut] {
//        
//        guard let url = self.url(forResource: file, withExtension: nil) else {
//            fatalError("Faild to locate \(file).")
//        }
//        
//        guard let data = try? Data(contentsOf: url) else {
//            fatalError("Failed to load \(file) from bundle.")
//        }
//                    
//        do {
//            return try JSONDecoder().decode([String: Astronaut].self, from: data)
//            
//        } catch DecodingError.keyNotFound(let key,  let context) {
//            fatalError("Fail to decode json file")
//        } catch {
//            fatalError("Something went wrong, plz check file")
//        }
//    }
    
    func decode<T: Codable>(_ file:  String) -> T {
        
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Faild to locate \(file).")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        var decoder = JSONDecoder()
       
//        let formatter = DateFormatter()
//        formatter.dateFormat = "y-MM-dd"
//        decoder.dateDecodingStrategy = .formatted(formatter)
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue)' – \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(file) from bundle due to type mismatch – \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing \(type) value – \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON.")
        } catch {
            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
    }
}
