//
//  createPageInNotion.swift
//  Votion
//
//  Created by Sam Dillard on 7/5/23.
//

import Foundation


struct TaskInput {
    var taskName: String
    var startDate: Date
//    var todo: Bool
//    var started: Bool
//    var done: Bool
    var description: String
}


func createPageInNotion(databaseID: String, apiKey: String, data: TaskInput) -> Void {

    guard let createPageUrl = URL(string: "https://api.notion.com/v1/pages") else {
        return
    }
    var request = URLRequest(url: createPageUrl)

    request.httpMethod = "POST"
    request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("2021-05-13", forHTTPHeaderField: "Notion-Version")
    
    let formatter = ISO8601DateFormatter()
    let startDateStringISO8601 = formatter.string(from: data.startDate)
    
    let json: [String: Any] = [
        "parent": ["database_id": "\(databaseID)"],
        "properties": [
            "Name": [
                "title": [
                    ["text": ["content": "\(data.taskName)"]]
                ]
            ],
            "Start date": [
                "date": ["start": "\(startDateStringISO8601)"]
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
                    ["text": ["content": "\(data.description)"]]
                ]
            ]
        ]
    ]
    
    let bodyData = try? JSONSerialization.data(withJSONObject: json)
    request.httpBody = bodyData
    print(request.httpBody)
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Error: \(error)")
        } else if let data = data {
            let str = String(data: data, encoding: .utf8)
            print("Received data:\n\(str ?? "")")
        }
    }
    
    task.resume()
}

