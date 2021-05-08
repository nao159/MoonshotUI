//
//  Bundle-Decodable.swift
//  MoonshotUI
//
//  Created by Максим Нуждин on 04.05.2021.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = url(forResource: file, withExtension: nil) else {
            fatalError("failed to locate \(file) in local bundle")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file)")
        }
        return loaded
    }
}
