//
//  NewYorkTimesApp.swift
//  NewYorkTimes
//
//  Created by Belen on 03/12/2024.
//

import SwiftUI

@main
struct NewYorkTimesApp: App {
    init() {
        saveAPIKeyIfNeeded()
    }
    
    var body: some Scene {
        WindowGroup {
            ArticlesView()
        }
    }
    
    private func saveAPIKeyIfNeeded() {
        let keyExists = SecureStorage.shared.getFromKeychain(key: "APIKey") != nil
        if !keyExists {
            let apiKey = "qTl6HA9lEk9bHwEMNSrdjRAceMnSqQEZ"
            let saved = SecureStorage.shared.saveToKeychain(key: "APIKey", value: apiKey)
            if saved {
                print("API Key saved to Keychain.")
            } else {
                print("Failed to save API Key to Keychain.")
            }
        } else {
            print("API Key already exists in Keychain.")
        }
    }
}
