//
//  MissionDetailsView.swift
//  MyAstronaut
//
//  Created by Mantosh Kumar on 19/09/24.
//

import SwiftUI

struct MissionDetailsView: View {
    
    let mission: Missions
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .padding()
                    
                    VStack(alignment: .leading) {
                        Text("Mission Discription")
                            .font(.title.bold())
                            .padding(.bottom)
                        
                        Text(mission.description)
                    }
                    
                }.padding()
            }.navigationTitle(mission.displayName)
                .navigationBarTitleDisplayMode(.inline)
                .background(.darkBackground)
        }
    }
}

#Preview {
    let mission: [Missions] = Bundle.main.decode("missions.json")
    return MissionDetailsView(mission: mission[0]).preferredColorScheme(.dark)
}
