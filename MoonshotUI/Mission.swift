//
//  Mission.swift
//  MoonshotUI
//
//  Created by Максим Нуждин on 05.05.2021.
//

import Foundation

struct Mission: Codable, Identifiable {
    let id: Int
    let launchDate: Date?
    let crew: [Crewrole]
    let description: String
    
    struct Crewrole: Codable {
        let name: String
        let role: String
    }
    
    var displayName: String {
        "Apollo \(id)"
    }
    var image: String {
        "apollo\(id)"
    }
    var formattedLaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
        } else {
            return "no date"
        }
    }
}
