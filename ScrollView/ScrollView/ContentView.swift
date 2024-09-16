//
//  ContentView.swift
//  ScrollView
//
//  Created by Mantosh Kumar on 16/09/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationStack {
            
            ScrollView {
                VStack {
                    ForEach(1..<200, id: \.self) { index in
//                        NavigationLink(value: index) {
                            Text("Mantosh - \(index)")

//                        }
                    }
                }
            }.navigationTitle(" Scroll View")
        }
    }
}

#Preview {
    ContentView()
}
