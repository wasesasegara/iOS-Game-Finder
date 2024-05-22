//
//  GameResponse.swift
//  GameFinder
//
//  Created by Bis  on 22/05/24.
//

import Foundation

struct GameResponse: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Game]
}
