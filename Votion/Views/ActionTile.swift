//
//  ActionTile.swift
//  Votion
//
//  Created by Sam Dillard on 7/5/23.
//

import SwiftUI

struct ActionTile<Label>: View where Label: View {
    @State private var isPressed = false
    
    var action: () -> Void
    var label: () -> Label
    let color: Color

    init(action: @escaping () -> Void,
         color: Color,
         @ViewBuilder label: @escaping () -> Label) {
            self.action = action
            self.label = label
            self.color = color
    }
    
    var body: some View {
        Button(action: {
            isPressed = true
            action()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isPressed = false
            }
        }) {
            label()
                .labelStyle(.titleAndIcon)
                .frame(
                    idealWidth: 200,
                    maxWidth: 250,
                    idealHeight: 150,
                    maxHeight: 200)
                .padding()
        }
        .font(.largeTitle .bold())
        .foregroundColor(.black)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(color)
                .scaleEffect(isPressed ? 0.98: 1.0)
            )
        .cornerRadius(10)
        .shadow(color: .gray, radius: 5, x: 2, y: 2)
        .padding()
    }
}

struct ActionTile_Previews: PreviewProvider {
    static var previews: some View {
        //        PersonalTaskForm()
        NavTile(action: {}, destination: PersonalTaskForm(), label: {Label("Personal", systemImage: "person")})
    }
}
