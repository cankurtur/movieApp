//
//  SearchViewModel.swift
//  movieApp
//
//  Created by Can Kurtur on 27.09.2021.
//

import Foundation

struct SearchViewModel {
    let networking = Networking()

    func getMultiSearch(query: String, completion: @escaping([SearchCardViewModel]) -> Void) {
        var searchCardViewModelArray: [SearchCardViewModel] = []
        let url = "\(APIConstants.multiSearchURL)\(query)"
        networking.performRequest(url: url) { (result: Result<MultiSearchResponseModel, Error>) in
            switch result {
            case.success(let multiSearchResponseModel):
                for multiSearch in multiSearchResponseModel.results {
                    let searchCardViewModel = SearchCardViewModel.init(multiSearch: multiSearch)
                    searchCardViewModelArray.append(searchCardViewModel)
                }
                completion(searchCardViewModelArray)
            case .failure(let error):
                print(error)
            }
        }
    }
}
