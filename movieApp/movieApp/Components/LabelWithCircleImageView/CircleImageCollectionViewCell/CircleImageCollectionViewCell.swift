//
//  CircleImageCollectionViewCell.swift
//  movieApp
//
//  Created by Can Kurtur on 24.09.2021.
//

import UIKit

class CircleImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var circleImage: FetchImageView!
    @IBOutlet private weak var textLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        // Initialization code
    }
    private func setupUI() {
        textLabel.font = .body2
        textLabel.textColor = .almostBlack

        circleImage.layer.masksToBounds = false
        circleImage.layer.cornerRadius = circleImage.frame.height / 2
        circleImage.clipsToBounds = true
    }

    func configure(text: String, imageLink: FetchImageViewUIModel) {
        textLabel.text = text
        circleImage.configure(viewModel: imageLink)
    }
}
