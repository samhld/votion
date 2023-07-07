//
//  ContentView.swift
//  Votion
//
//  Created by Sam Dillard on 7/3/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                AppBar(title: "Votion")
                    .frame(width: geometry.size.width, height: 44)
                NavigationStack {
                    ScrollView {
                        VStack {
                            Spacer()
                                .padding(40.0)
                            Text("Create Task")
                                .font(.title)
                                .foregroundColor(.black)
                                .padding(.bottom, 20)
                            CustomNavLink(
                                labelName: "Personal",
                                icon: "person",
                                linkDestination: PersonalTaskForm())
                            .padding(.bottom, 30)
                            CustomNavLink(
                                labelName: "Business",
                                icon: "laptopcomputer.and.iphone",
                                linkDestination: BusinessTaskForm())
                        }
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
