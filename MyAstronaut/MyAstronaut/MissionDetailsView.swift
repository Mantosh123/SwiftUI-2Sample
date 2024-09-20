//
//  MissionDetailsView.swift
//  MyAstronaut
//
//  Created by Mantosh Kumar on 19/09/24.
//

import SwiftUI

struct MissionDetailsView: View {
    
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Missions
    let crew: [CrewMember]
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .padding()
                    
                    VStack(alignment: .leading) {
                        
                        Rectangle()
                            .frame(height: 2)
                            .background(.blue)
                            .padding()
                        
                        Text("Mission Discription")
                            .font(.title.bold())
                            .padding(.bottom)
                        
                        Text(mission.description)
                        
                        Rectangle().frame(height: 2)
                            .background(.gray)
                        
                        Text("Crew")
                            .font(.title)
                            .bold()
                    }.padding(.horizontal)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(crew, id: \.role)  { crewMember in
                                NavigationLink {
                                    AstronautView(astronaut: crewMember.astronaut)
                                } label: {
                                    HStack {
                                        Image(crewMember.astronaut.id)
                                            .resizable()
                                            .frame(width: 100, height: 70)
                                            .clipShape(.capsule)
                                            .overlay(
                                                Capsule()
                                                    .strokeBorder(.white, lineWidth: 2)
                                            )
                                        
                                        VStack(alignment: .leading) {
                                            Text(crewMember.astronaut.name)
                                                .foregroundStyle(.black)
                                            Text(crewMember.role)
                                                .foregroundStyle(.secondary)
                                        }
                                        
                                    }
                                }
                            }
                        }.padding()
                    }
                    
                }.padding(.bottom)
            }.navigationTitle(mission.displayName)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    init(missions: Missions, astronaut: [String: Astronaut]) {
        
        self.mission = missions
        self.crew = mission.crew.map { member in
            if let astronut = astronaut[member.name] {
                return CrewMember(role: member.role, astronaut: astronut)
            } else {
                fatalError("some error")
            }
        }
    }
}

//#Preview {
//    let mission: [Missions] = Bundle.main.decode("missions.json")
//    let astanout: [String: Astronaut] = Bundle.main.decode("astronauts.json")
//    return MissionDetailsView(missions: mission[0], astronaut: astanout)
//        .preferredColorScheme(.dark)
//}
