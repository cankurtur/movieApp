//
//  SearchViewUIModel.swift
//  movieApp
//
//  Created by Can Kurtur on 27.09.2021.
//

import Foundation

struct SearchViewUIModel {
    var imagePath: String
    var name: String
    var imageWithLabel: ImageWithLabelUIModel

    init(multiSearch: ResultsResponseModel) {
        switch multiSearch.mediaType {
        case .movieType:
            self.name = multiSearch.title ?? ""
            self.imagePath = multiSearch.posterPath ?? ""

            let imageWithLabelUIModel = ImageWithLabelUIModel(image: .calendarIcon, labelText: "Movie")
            self.imageWithLabel = imageWithLabelUIModel

        case .tvType:
            self.name = multiSearch.name ?? ""
            self.imagePath = multiSearch.posterPath ?? ""

            let imageWithLabelUIModel = ImageWithLabelUIModel(image: .calendarIcon, labelText: "Tv Series")
            self.imageWithLabel = imageWithLabelUIModel

        case .personType:
            self.name = multiSearch.name ?? ""
            self.imagePath = multiSearch.profilePath ?? ""

            let imageWithLabelUIModel = ImageWithLabelUIModel(image: .calendarIcon, labelText: "Actor")
            self.imageWithLabel = imageWithLabelUIModel
        }
    }
}
