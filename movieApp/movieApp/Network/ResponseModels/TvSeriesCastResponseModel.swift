//
//  TvSeriesCastResponseModel.swift
//  movieApp
//
//  Created by Can Kurtur on 24.09.2021.
//

import Foundation

struct TvSeriesCastResponseModel: Codable {
    let cast: [CastResponseModel]
}

struct CastResponseModel: Codable {
    let id: Int
    let name: String?
    let profilePath: String?

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case profilePath = "profile_path"
    }
}
