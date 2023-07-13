//
//  SubmitButton.swift
//  Votion
//
//  Created by Sam Dillard on 7/6/23.
//

import SwiftUI

struct SubmitButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Label("Submit Task", systemImage: "paperplane")
                .font(Font.body.weight(.heavy))
                .frame(width: 200, height: 50)
                .foregroundStyle(.black)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color("Olive"))
                )
        }
    }
}

//struct SubmitButton_Previews: PreviewProvider {
//    static var previews: some View {
//        SubmitButton(action: { createPageInNotion(
//            databaseID: "",
//            apiKey: "")
//        })
//    }
//}


