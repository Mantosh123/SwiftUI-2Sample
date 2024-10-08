//
//  ContentView.swift
//  MyAstronaut
//
//  Created by Mantosh Kumar on 18/09/24.
//

import SwiftUI

struct ContentView: View {
    
    let astronaut: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Missions]  = Bundle.main.decode("missions.json")
    
    let coloums = [ 
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: coloums) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            MissionDetailsView(missions: mission, astronaut: astronaut)
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 150, height: 150)
                                    .padding()
                                
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    Text(mission.launchDate ?? "No Date")
                                        .font(.subheadline)
                                        .foregroundStyle(.white)
                                }
                                    .padding(.vertical)
                                    .frame(maxWidth: .infinity)
                                    .background(.blue)
                                
                            }.clipShape(.rect(cornerRadius: 10))
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.blue))
                        }
                    }
                }.padding()
            }.navigationTitle("Apollo Astronauts")
                .foregroundStyle(.white)
//                .background(.darkBackground)
        }
    }
}

#Preview {
    ContentView()
}
