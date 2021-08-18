//
//  CardViewWithImageAndDetails.swift
//  movieApp
//
//  Created by Can Kurtur on 9.08.2021.
//

import UIKit

class CardViewWithImageAndDetails: UIView {
    // MARK: - Constant
    private struct Constants {
        static let cornerRadius: CGFloat = 8
        static let detailsLabelOpacity: CGFloat = 0.8
    }

    // MARK: - IBOutlet
    @IBOutlet private weak var coverImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var detailsLabel: UILabel!
    @IBOutlet private weak var imageWithLabelView: ImageWithLabel!
    @IBOutlet private weak var separatorView: UIView!
    @IBOutlet private weak var iconWithPointLabelView: IconWithPointLabel!

    // MARK: - Business Logic
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        let view = self.nibInstantiate(autoResizingMask: [.flexibleHeight, .flexibleWidth])
        view.frame = self.bounds
        addSubview(view)
        setupUI()
    }

    private func setupUI() {
        layer.cornerRadius = Constants.cornerRadius
        backgroundColor = .white
        titleLabel.font = .headline3
        titleLabel.textColor = .almostBlack
        detailsLabel.font = .body1
        detailsLabel.alpha = Constants.detailsLabelOpacity
        detailsLabel.textColor = .almostBlack
    }

    func configure(UIModel: CardViewWithImageAndDetailsUIModel) {
            coverImageView.image = UIImage(named: UIModel.coverImageText)
            titleLabel.text = UIModel.titleText
            detailsLabel.text = UIModel.detailsText
            imageWithLabelView.configure(UIModel: UIModel.imageWithLabelView)
            iconWithPointLabelView.configure(UIModel: UIModel.iconWithPointLabel)
    }
}
