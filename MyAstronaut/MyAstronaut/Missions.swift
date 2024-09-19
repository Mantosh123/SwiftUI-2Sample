//
//  Missions.swift
//  MyAstronaut
//
//  Created by Mantosh Kumar on 18/09/24.
//

import SwiftUI

struct Missions: Codable, Identifiable {
    
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo\(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
//    var formatedLaunchDate: String {
//        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
//    }
    
//    var formattedLaunchDate: String {
//        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
//    }
}
