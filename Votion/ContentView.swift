//
//  ContentView.swift
//  Votion
//
//  Created by Sam Dillard on 7/3/23.
//

import SwiftUI

struct ContentView: View {
//    let olive = Color("Olive")
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                AppBar(title: "Votion")
                    .frame(width: geometry.size.width, height: 44)
                
                ScrollView {
                    VStack {
                        Spacer()
                            .padding(40.0)
                        Text("Create Task")
                            .font(.title)
                            .foregroundColor(.black)
                            .padding()
                        ActionTile(action: {createPageInNotion()}, color: Color("Olive"), label: {
                            Label("Personal", systemImage: "person")
                        });
                        ActionTile(action: {}, color: Color("Olive").opacity(0.4), label: {
                            Label("Work", systemImage: "laptopcomputer.and.iphone")
                        })
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
