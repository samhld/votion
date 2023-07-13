//
//  CustomNavLink.swift
//  Votion
//
//  Created by Sam Dillard on 7/5/23.
//

import SwiftUI


struct CustomNavLink<Destination: View>: View {
    @State private var isPressed: Bool = false
    let labelName: String
    let color: Color = Color("Olive")
    let icon: String
    
    let linkDestination: Destination
    
    var body: some View {
            NavigationLink(
                destination: linkDestination,
                isActive: $isPressed,
                label: {
                    Button(action: {
                        isPressed = true
                    }) {
                        VStack {
                            Label(labelName, systemImage: icon)
                                .foregroundColor(.black)
                        }
                        .frame(width: 250, height: 200)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(color)
                        )
                    }
                    .buttonStyle(CustomNavigationButtonStyle(isActive: isPressed))
                }
            )
    }
}

struct CustomNavigationButtonStyle: ButtonStyle {
    let isActive: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.largeTitle.bold())
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("Olive"))
                    .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            )
            .cornerRadius(10)
            .shadow(color: .gray, radius: 5, x: 2, y: 2) // Add animation modifier here if desired
    }
}


struct CustomNavLink_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            VStack {
                CustomNavLink(
                    labelName: "Personal",
                    icon: "person",
                    linkDestination: PersonalTaskForm())
                .padding(20)
//                CustomNavLink(
//                    labelName: "Business",
//                    icon: "laptopcomputer.and.iphone",
//                    linkDestination: BusinessTaskForm())
            }
            .padding()
        }
    }
}



