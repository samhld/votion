//
//  NavTile.swift
//  Votion
//
//  Created by Sam Dillard on 7/5/23.
//

import SwiftUI

struct NavTile<Label, Destination>: View where Label: View, Destination: View {
    @State private var isPressed = false
    
    var action: () -> Void
    var label: () -> Label
    var destination: Destination

    init(action: @escaping () -> Void,
         destination: Destination,
         @ViewBuilder label: @escaping () -> Label) {
            self.action = action
            self.destination = destination
            self.label = label
    }
    
    var body: some View {
        NavigationLink(destination: destination) {
            Button(action: {
                isPressed = true
                action()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    isPressed = false
                }
            }, label: label)
        }
        .frame(
            idealWidth: 200,
            maxWidth: 250,
            idealHeight: 150,
            maxHeight: 200)
        .padding()
        .font(.largeTitle.bold())
        .foregroundColor(.black)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .scaleEffect(isPressed ? 0.98: 1.0)
        )
        .cornerRadius(10)
        .shadow(color: .gray, radius: 5, x: 2, y: 2)
        .padding()
        .onTapGesture {
            isPressed = true
            action()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isPressed = false
            }
        }
        .overlay(label())
    }
}

//struct NavTile_Previews: PreviewProvider {
//    static var previews: some View {
//        NavTile()
//    }
//}
