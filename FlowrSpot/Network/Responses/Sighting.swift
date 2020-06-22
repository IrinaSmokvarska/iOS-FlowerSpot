//
//  Sighting.swift
//  FlowrSpot
//
//  Created by Irina Smokvarska on 6/22/20.
//  Copyright © 2020 PovioLabs. All rights reserved.
//

import Foundation

struct Sighting: Codable {
    let id: Int
    let name: String
    let description: String
    let picture: String
    let likesCount: Int
    let commentsCount: Int
    let createdAt: String
    let latitude: Double
    let longitude: Double
    let user: User
    let flower: FlowerSighting
}

struct User: Codable {
    let id: Int
    let fullName: String
}

struct FlowerSighting: Codable {
    let id: Int
    let name: String
    let latinName: String
    let profilePicture: String
}
