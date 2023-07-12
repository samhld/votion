//
//  getConfiguration.swift
//  Votion
//
//  Created by Sam Dillard on 7/10/23.
//

import Foundation

func getConfiguration() -> [String: Any]? {
    
    guard let filePath = Bundle.main.url(forResource: "vars", withExtension: "plist"),
          let plistDict = NSDictionary(contentsOf: filePath) as? [String: Any] else {
        return nil
        }
    
    return plistDict
}
