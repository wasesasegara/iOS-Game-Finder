//
//  Game.swift
//  GameFinder
//
//  Created by Bis  on 22/05/24.
//

import Foundation

struct Game: Codable, Identifiable {
    let id: Int
    let slug: String
    let name: String
    let released: String
    let tba: Bool
    let backgroundImage: String
    let rating: Double
    let ratingTop: Int
    let ratings: [Rating]
    let ratingsCount: Int
    let reviewsTextCount: Int
    let added: Int
    let addedByStatus: AddedByStatus
    let metacritic: Int
    let playtime: Int
    let suggestionCount: Int?
    let updated: String
    let userGame: Int?
    let reviewsCount: Int
    let saturatedColor: String
    let dominantColor: String
    let platforms: [PlatformsItem]?
    let parentPlatforms: [ParentPlatformsItem]
    let genres: [Genre]
    let stores: [StoresItem]
    let esrbRating: EsrbRating?
    let shortScreenshots: [ShortScreenshot]
    
    struct Rating: Codable, Identifiable {
        let id: Int
        let title: String
        let count: Int
        let percent: Double
    }
    
    struct AddedByStatus: Codable {
        let yet, owned, beaten, toplay, dropped, playing: Int
    }
    
    struct PlatformsItem: Codable {
        let platform: Platform?
        let releasedAt: String?
        let requirementsEn: Requirements?
        
        struct Platform: Codable, Identifiable {
            let id: Int
            let slug: String
            let name: String
            let image: String?
            let yearEnd: Int?
            let yearStart: Int?
            let gamesCount: Int
            let imageBackground: String
        }
        
        struct Requirements: Codable {
            let minimum: String
            let recommended: String?
        }
    }
    
    struct EsrbRating: Codable, Identifiable {
        let id: Int
        let slug: String
        var slugType: SlugType {
            SlugType(rawValue: slug) ?? .ratePending
        }
        let name: String
        
        enum SlugType: String, CaseIterable {
            case everyone
            case everyone10Plus = "everyone-10-plus"
            case teen
            case mature
            case adultsOnly = "adults-only"
            case ratePending = "rate-pending"
            
            static func fromName(_ name: String) -> SlugType {
                switch name {
                case "Everyone": return SlugType.everyone
                case "Everyone 10+": return SlugType.everyone10Plus
                case "Teen": return SlugType.teen
                case "Mature": return SlugType.mature
                case "Adults Only": return SlugType.adultsOnly
                case "Rating Pending": return SlugType.ratePending
                default: return SlugType.ratePending
                }
            }
        }
    }
    
    struct ParentPlatformsItem: Codable {
        let platform: Platform
        
        struct Platform: Codable, Identifiable {
            let id: Int
            let name: String
            let slug: String
        }
    }
    
    struct Genre: Codable, Identifiable {
        let id: Int
        let name: String
        let slug: String
        let gamesCount: Int
        let imageBackground: String
    }
    
    struct StoresItem: Codable, Identifiable {
        let id: Int
        let store: Store
        
        struct Store: Codable, Identifiable {
            let id: Int
            let name: String
            let slug: String
            let domain: String
            let gamesCount: Int
            let imageBackground: String
        }
    }
    
    struct ShortScreenshot: Codable, Identifiable {
        let id: Int
        let image: String
    }
}
