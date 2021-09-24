//
//  FetchImageView.swift
//  movieApp
//
//  Created by Can Kurtur on 15.09.2021.
//

import UIKit
import Kingfisher

class FetchImageView: UIImageView {
    func configure(viewModel: FetchImageViewUIModel) {
        image = .dummyImage
        let imageURL = URL(string: "\(APIConstants.imageBaseURL)\(viewModel.imageLink)")
        self.kf.setImage(with: imageURL)
    }
}