//
//  VerticalCardCollectionViewCell.swift
//  movieApp
//
//  Created by Can Kurtur on 19.09.2021.
//

import UIKit

class VerticalCardCollectionViewCell: UICollectionViewCell {
    // MARK: - Constants
    struct Constants {
        static let cornerRadius: CGFloat = 8
        static let shadowRadius: CGFloat = 5.0
        static let shadowOffset: CGSize = CGSize.init(width: 0, height: 5)
        static let shadowOpacity: Float = 0.1
    }

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var verticalCardView: VerticalCardViewWithImageAndDetails!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupShadow()
    }
    private func setupShadow() {
        verticalCardView.layer.cornerRadius = Constants.cornerRadius
        verticalCardView.layer.masksToBounds = true

        containerView.layer.cornerRadius = Constants.cornerRadius
        containerView.layer.masksToBounds = true

        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowRadius = Constants.shadowRadius
        containerView.layer.shadowOffset = Constants.shadowOffset
        containerView.layer.shadowOpacity = Constants.shadowOpacity
        containerView.backgroundColor = nil
    }
    func configure(with verticalCardViewUIModel: VerticalCardViewWithImageAndDetailsUIModel) {
        verticalCardView.configure(viewModel: verticalCardViewUIModel)
    }
}
