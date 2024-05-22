//
//  ApiManagerGames.swift
//  GameFinder
//
//  Created by Bis  on 22/05/24.
//

import Foundation

class ApiManagerGames {
    func call(parameters: Parameters? = nil) async throws -> GameResponse {
        let parameters = parameters ?? Parameters(page: 1, pageSize: 20, search: nil)
        
        var urlComponents = URLComponents(string: ApiUrlPath.games)
        
        guard let params = parameters.toUrlQueryItems() else {
            throw NetworkError.createQueryParamItemsFailed
        }
        urlComponents?.queryItems = params + [NetworkConfig.keyQueryItem]
        
        guard let url = urlComponents?.url else {
            throw NetworkError.badUrl
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let result = try decoder.decode(GameResponse.self, from: data)
            return result
        } catch {
            throw NetworkError.decodeFailed
        }
    }
    
    struct Parameters: Encodable {
        let page: Int
        let pageSize: Int
        let search: String?
    }
}
