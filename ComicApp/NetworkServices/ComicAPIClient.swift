//
//  ComicAPIClient.swift
//  ComicApp
//
//  Created by casandra grullon on 12/26/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import Foundation

struct ComicAPIClient {
    static func getComicVolumes(for search: String, completion: @escaping (Result<[Comic], AppError>) -> () ) {
        
        let searchQuery = search.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        
        let endpointURL = "https://comicvine.gamespot.com/api/search/?api_key=\(Secrets.apiKey)&format=json&sort=date_added:asc&resources=volume&query=\(searchQuery)"
        
        guard let url = URL(string: endpointURL) else {
            completion(.failure(.badURL(endpointURL)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let comics = try JSONDecoder().decode([Comic].self, from: data)
                    completion(.success(comics))
                }catch{
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}
