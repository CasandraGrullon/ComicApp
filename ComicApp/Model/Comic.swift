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
    let deck: String?
    let image: Image
    let issueNumber: String?
    let name: String
    let volume: Volume?
    let publisher: Publisher?
    let numberOfIssues: Int?
    let startYear: String?
    
    enum CodingKeys: String, CodingKey{
        case deck
        case image
        case issueNumber = "issue_number"
        case name
        case volume
        case publisher
        case numberOfIssues = "count_of_issues"
        case startYear = "start_year"
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
    let name: String?
}
struct Publisher: Decodable {
    let name: String
}
