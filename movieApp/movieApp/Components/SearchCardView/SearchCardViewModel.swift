//
//  SearchCardViewModel.swift
//  movieApp
//
//  Created by Can Kurtur on 27.09.2021.
//

import Foundation

struct SearchCardViewModel {
    let id: Int
    let mediaType: MediaType
    let posterPath: String
    let titleText: String
    let detailsText: String
    let imageWithLabelViewModel: ImageWithLabelUIModel

    init(multiSearch: ResultsResponseModel) {
        switch multiSearch.mediaType {
        case .movieType:
            self.id = multiSearch.id
            self.titleText = multiSearch.title ?? ""
            self.posterPath = multiSearch.posterPath ?? ""
            self.detailsText = ""
            
            let imageWithLabelUIModel = ImageWithLabelUIModel(image: .calendarIcon, labelText: "Movie")
            self.imageWithLabelViewModel = imageWithLabelUIModel

        case .tvType:
            self.id = multiSearch.id
            self.titleText = multiSearch.name ?? ""
            self.posterPath = multiSearch.posterPath ?? ""
            self.detailsText = ""

            let imageWithLabelUIModel = ImageWithLabelUIModel(image: .calendarIcon, labelText: "Tv Series")
            self.imageWithLabelViewModel = imageWithLabelUIModel

        case .personType:
            self.id = multiSearch.id
            self.titleText = multiSearch.name ?? ""
            self.posterPath = multiSearch.profilePath ?? ""
            self.detailsText = ""

            let imageWithLabelUIModel = ImageWithLabelUIModel(image: .calendarIcon, labelText: "Actor")
            self.imageWithLabelViewModel = imageWithLabelUIModel
        }
        self.mediaType = multiSearch.mediaType
    }
}
