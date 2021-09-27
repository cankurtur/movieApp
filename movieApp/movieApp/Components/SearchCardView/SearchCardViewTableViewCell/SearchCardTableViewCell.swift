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
        static let cornerRadius: CGFloat = 8
        static let shadowRadius: CGFloat = 5.0
        static let shadowOffset: CGSize = CGSize.init(width: 0, height: 5)
        static let shadowOpacity: Float = 0.1
    }
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var searchCardView: SearchCardView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupShadow()
    }

    private func setupShadow() {
        searchCardView.backgroundColor = .white
        searchCardView.layer.cornerRadius = Constants.cornerRadius
        searchCardView.layer.masksToBounds = true

        containerView.layer.cornerRadius = Constants.cornerRadius
        containerView.layer.masksToBounds = true

        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowRadius = Constants.shadowRadius
        containerView.layer.shadowOffset = Constants.shadowOffset
        containerView.layer.shadowOpacity = Constants.shadowOpacity
        containerView.backgroundColor = nil
    }

    func configure(viewModel: SearchCardViewModel) {
        searchCardView.configure(viewModel: viewModel)
    }
}
