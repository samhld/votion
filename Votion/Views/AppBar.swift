//
//  AppBar.swift
//  Votion
//
//  Created by Sam Dillard on 7/5/23.
//

import SwiftUI

struct AppBar: View {
    let title: String
    
    var body: some View {
        HStack {
            Spacer()
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
        }
        .background(Color.black)
    }
}

struct AppBar_Previews: PreviewProvider {
    static var previews: some View {
        AppBar(title: "test")
    }
}
