//
//  ResponseModel.swift
//  UI elements
//
//  Created by Алексей Олудин on 28.09.2024.
//

import Foundation

struct ResponseModel: Codable {
    let id: String?
    let views: Int?
    let downloads: Int?
    let likes: Int?
    let urls: Urls?
    let user: User?
    let createdAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case urls
        case user, views, downloads, likes
    }
}


// MARK: - Urls

struct Urls: Codable {
    let raw, full, regular, small, thumb: String?
}

// MARK: - User

struct User: Codable {
    let id: String?
    let username, name: String?
    let location: String?
}
