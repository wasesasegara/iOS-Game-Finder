//
//  Encodable+Ext.swift
//  GameFinder
//
//  Created by Bis  on 22/05/24.
//

import Foundation

extension Encodable {
    func toUrlQueryItems() -> [URLQueryItem]? {
        do {
            let data = try JSONEncoder().encode(self)
            guard let dict = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                debugPrint("Conversion \(String(describing: Self.self)) to URLQueryItems failed")
                return nil
            }
            return dict.compactMap { (key, value) in
                if let value = value as? String {
                    return URLQueryItem(name: key, value: value)
                }
                if let value = value as? Int {
                    return URLQueryItem(name: key, value: String(value))
                }
                if let value = value as? Double {
                    return URLQueryItem(name: key, value: String(value))
                }
                if let value = value as? Bool {
                    return URLQueryItem(name: key, value: String(value))
                }
                return nil
            }
            
        } catch {
            return nil
        }
    }
}
