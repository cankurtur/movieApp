//
//  CustomTableViewCell.swift
//  movieApp
//
//  Created by Can Kurtur on 9.08.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    // MARK: - Constants
    struct Constants {
        static let contentViewFrame: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        static let cornerRadius: CGFloat = 8
        static let shadowRadius: CGFloat = 3.0
        static let shadowOffset: CGSize = CGSize.init(width: 0, height: 3)
        static let shadowOpacity: Float = 0.1
    }
    // MARK: - IBOutlet
    @IBOutlet private weak var cardViewWithImageAndDetails: CardViewWithImageAndDetails!
    @IBOutlet private weak var viewContainer: UIView!

    // MARK: - Business Logic
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setupShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupShadow() {
        contentView.frame = contentView.frame.inset(by: Constants.contentViewFrame)

        self.cardViewWithImageAndDetails.layer.cornerRadius = Constants.cornerRadius
        self.cardViewWithImageAndDetails.layer.masksToBounds = true

        let bezierPath = UIBezierPath.init(roundedRect: self.viewContainer.bounds, cornerRadius: Constants.cornerRadius)
        self.viewContainer.layer.shadowPath = bezierPath.cgPath
        self.viewContainer.layer.masksToBounds = false
        self.viewContainer.layer.shadowColor = UIColor.black.cgColor
        self.viewContainer.layer.shadowRadius = Constants.shadowRadius
        self.viewContainer.layer.shadowOffset = Constants.shadowOffset
        self.viewContainer.layer.shadowOpacity = Constants.shadowOpacity
        self.viewContainer.backgroundColor = nil
    }

    func configure(with cardViewWithImageAndDetailsUIModel: CardViewWithImageAndDetailsUIModel) {
        cardViewWithImageAndDetails.configure(UIModel: cardViewWithImageAndDetailsUIModel)
    }
}
