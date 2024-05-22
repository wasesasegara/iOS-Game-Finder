//
//  NetworkError.swift
//  GameFinder
//
//  Created by Bis  on 22/05/24.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case createQueryParamItemsFailed
    case decodeFailed
}
