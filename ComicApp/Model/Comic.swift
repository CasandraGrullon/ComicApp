//
//  Comic.swift
//  ComicApp
//
//  Created by casandra grullon on 12/26/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import Foundation

struct Comic: Decodable {
    let results: [Results]
}
struct Results: Decodable {
    let releaseDate: String
    let endDate: String
    let deck: String?
    let image: Image
    let issueNumber: String
    let name: String
    let volume: Volume
    
    enum CodingKeys: String, CodingKey{
        case releaseDate = "date_added"
        case endDate = "date_last_updated"
        case deck
        case image
        case issueNumber = "issue_number"
        case name
        case volume
    }
}
struct Image: Decodable {
    let thumbImage: String
    let largeImage: String
    
    enum CodingKeys: String, CodingKey {
        case thumbImage = "thumb_url"
        case largeImage = "super_url"
    }
}
struct Volume: Decodable {
    let name: String
}
