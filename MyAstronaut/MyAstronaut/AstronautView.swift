//
//  AstronautView.swift
//  MyAstronaut
//
//  Created by Mantosh Kumar on 20/09/24.
//

import SwiftUI

struct AstronautView: View {
    
    let astronaut: Astronaut
    
    var body: some View {
        
        ScrollView {
            VStack {
                Image(astronaut.id)
                Text(astronaut.description)
            }.padding()
        }
    }
}

//#Preview {
    
//    let astrount: [String: Astronaut] = Bundle.main.decode("astronauts.json")
//    return AstronautView(astronaut: astrount["aldrian"]!)
//}
