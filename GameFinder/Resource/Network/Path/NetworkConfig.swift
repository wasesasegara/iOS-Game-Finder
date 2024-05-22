//
//  NetworkConfig.swift
//  GameFinder
//
//  Created by Bis  on 22/05/24.
//

import Foundation

class NetworkConfig {
    static let rawgApiKey = "ff7e58d2e5d543f5a7fc6ed3d852d82f"
    static let endpoint = "https://api.rawg.io/api"
    static let keyQueryItem = URLQueryItem(name: "key", value: rawgApiKey)
}

class ApiUrlPath {
    static let games = NetworkConfig.endpoint + "/games"
}
