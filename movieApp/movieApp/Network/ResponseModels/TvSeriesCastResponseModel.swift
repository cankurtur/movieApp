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
    let name: String
    let profilePath: String

    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case profilePath = "profile_path"
    }
}
