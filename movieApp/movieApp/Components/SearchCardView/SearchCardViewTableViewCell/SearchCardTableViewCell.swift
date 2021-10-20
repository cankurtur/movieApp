//
//  SearchCardTableViewCell.swift
//  movieApp
//
//  Created by Can Kurtur on 27.09.2021.
//

import UIKit

class SearchCardTableViewCell: UITableViewCell {
    // MARK: - Constants
    struct Constants {
        static let contentViewFrame: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        static let cornerRadius: CGFloat = 8
        static let shadowRadius: CGFloat = 3.0
        static let shadowOffset: CGSize = CGSize.init(width: 0, height: 3)
        static let shadowOpacity: Float = 0.1
    }

    @IBOutlet private weak var viewContainer: UIView!
    @IBOutlet private weak var searchCardView: SearchCardView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupShadow()
    }

    func setupShadow() {
        contentView.frame = contentView.frame.inset(by: Constants.contentViewFrame)

        searchCardView.layer.cornerRadius = Constants.cornerRadius
        searchCardView.layer.masksToBounds = true

        let bezierPath = UIBezierPath.init(roundedRect: self.viewContainer.bounds, cornerRadius: Constants.cornerRadius)
        viewContainer.layer.shadowPath = bezierPath.cgPath
        viewContainer.layer.shadowColor = UIColor.black.cgColor
        viewContainer.layer.cornerRadius = Constants.cornerRadius
        viewContainer.layer.masksToBounds = true
        viewContainer.layer.shadowRadius = Constants.shadowRadius
        viewContainer.layer.shadowOffset = Constants.shadowOffset
        viewContainer.layer.shadowOpacity = Constants.shadowOpacity
        viewContainer.backgroundColor = nil
    }

    func configure(viewModel: SearchCardViewModel) {
        searchCardView.configure(viewModel: viewModel)
    }
}
