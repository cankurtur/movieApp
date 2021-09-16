//
//  CustomCollectionViewCell.swift
//  movieApp
//
//  Created by Can Kurtur on 11.09.2021.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var imageView: FetchImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(image: FetchImageViewUIModel) {
        imageView.configure(viewModel: image)
    }
}
