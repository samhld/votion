//
//  CustomNavLink.swift
//  Votion
//
//  Created by Sam Dillard on 7/5/23.
//

import SwiftUI


struct CustomNavLink: View {
    @State private var isActive: Bool = false
    @State private var isPressed: Bool = false
    var body: some View {
        NavigationStack {
            NavigationLink(
                destination: PersonalTaskForm(),
                label: {
                    Label("Peronsal", systemImage: "person")
                }
            )
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("Olive"))
                    .frame(width: 200, height: 200)
                )
            .scaleEffect(isPressed ? 0.98: 1.0)
            .onTapGesture {
                isActive = true
                isPressed = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.03) {
                    isPressed = false
                }

            }

        }

    }
}

struct CustomNavLink_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavLink()
    }
}


