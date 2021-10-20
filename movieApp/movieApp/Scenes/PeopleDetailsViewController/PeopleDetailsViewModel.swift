//
//  PeopleDetailsViewModel.swift
//  movieApp
//
//  Created by Can Kurtur on 26.09.2021.
//

import Foundation

struct PeopleDetailsViewModel {
    let networking = Networking()

    func getPeopleDetails(id: Int, completion: @escaping(PeopleDetailsUIModel) -> Void ) {
        let peopleDetailsURL = "\(APIConstants.peopleDetailsBaseURL)\(id)\(APIConstants.peopleDetailsLastURL)"
        networking.performRequest(url: peopleDetailsURL) { (result: Result<PeopleDetailsResponseModel, Error>) in
            switch result {
            case.success(let peopleDetailsResponseModel):
                let peopleDetailsUIModel = PeopleDetailsUIModel.init(peopleDetailsResponseModel: peopleDetailsResponseModel)
                completion(peopleDetailsUIModel)
            case .failure(let error):
                print(error)
            }
        }
    }
}
