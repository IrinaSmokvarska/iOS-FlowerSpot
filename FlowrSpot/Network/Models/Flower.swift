//
//  Flower.swift
//  FlowrSpot
//
//  Created by TK on 18/01/2018.
//  Copyright © 2018 PovioLabs. All rights reserved.
//

struct FlowerDetails: Codable {
    let flower: Flower
}

struct Flower: Codable {
    let id: Int
    let name: String
    let latinName: String
    let sightings: Int
    let profilePicture: String
    let favorite: Bool
    let features: [String]?
    let description: String?
}
