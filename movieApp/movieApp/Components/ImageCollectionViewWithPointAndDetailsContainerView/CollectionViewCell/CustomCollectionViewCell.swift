//
//  CustomCollectionViewCell.swift
//  movieApp
//
//  Created by Can Kurtur on 11.09.2021.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    // MARK: - IBOutlets
    @IBOutlet private weak var imageView: FetchImageView!

    // MARK: - Business Logic
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(uiModel: FetchImageViewUIModel) {
        imageView.configure(viewModel: uiModel)
    }
}
