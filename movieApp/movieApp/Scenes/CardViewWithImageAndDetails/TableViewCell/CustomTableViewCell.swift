//
//  CustomTableViewCell.swift
//  movieApp
//
//  Created by Can Kurtur on 9.08.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    // MARK: - IBOutlet
    @IBOutlet private weak var cardViewWithImageAndDetails: CardViewWithImageAndDetails!

    // MARK: - Business Logic
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(with cardViewWithImageAndDetailsUIModel: CardViewWithImageAndDetailsUIModel) {
        cardViewWithImageAndDetails.configure(UIModel: cardViewWithImageAndDetailsUIModel)
    }
}
