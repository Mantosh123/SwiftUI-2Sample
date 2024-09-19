//
//  ContentView.swift
//  ScrollView
//
//  Created by Mantosh Kumar on 16/09/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        var array = ["Sdfs", "sdfs", 1, 2, 3, 3.3] as Any
        
        var dic = ["sds": "sdfs", "sss": 1, "sss": 3.3] as Any
        
        @State var tuple = (x: 20, y: 30.22, z: "2233")
        
        
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
