//
//  createPageInNotion.swift
//  Votion
//
//  Created by Sam Dillard on 7/5/23.
//

import Foundation



//let databaseID = ""

func createPageInNotion(databaseID: String, apiKey: String) -> Void {

    guard let createPageUrl = URL(string: "https://api.notion.com/v1/pages") else {
        return
    }
    var request = URLRequest(url: createPageUrl)

    request.httpMethod = "POST"
    request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("2021-05-13", forHTTPHeaderField: "Notion-Version")
    
    let json: [String: Any] = [
        "parent": ["database_id": "\(databaseID)"],
        "properties": [
            "Name": [
                "title": [
                    ["text": ["content": "Testing from Swift"]]
                ]
            ],
            "To Do": [
                "checkbox": true
            ],
            "Started": [
                "checkbox": false
            ],
            "Done": [
                "checkbox": false
            ],
            "Description": [
                "rich_text": [
                    ["text": ["content": "Swift checking in"]]
                ]
            ]
        ]
    ]
    
    let bodyData = try? JSONSerialization.data(withJSONObject: json)
    request.httpBody = bodyData
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Error: \(error)")
//            completion(false)
        } else if let data = data {
            let str = String(data: data, encoding: .utf8)
            print("Received data:\n\(str ?? "")")
//            completion(true)
        }
    }
    
    task.resume()
}

