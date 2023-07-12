//
//  VotionApp.swift
//  Votion
//
//  Created by Sam Dillard on 7/3/23.
//

import SwiftUI



@main
struct VotionApp: App {

    @AppStorage("notiontoken") var notiontoken: String?
    @AppStorage("databaseid") var databaseID: String?
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear(perform: {
                    guard let dict = getConfiguration() else {
                        return
                    }
                          notiontoken = dict["notiontoken"] as? String
                          databaseID = dict["databaseid"] as? String
                })
        }
    }
}
