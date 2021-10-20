//
//  ImageWithLabel.swift
//  movieApp
//
//  Created by Can Kurtur on 9.08.2021.
//

import UIKit

class ImageWithLabel: UIView {
    // MARK: - Constants
    private struct Constants {
        static let fontSize: CGFloat = 12
        static let dateOpacity: CGFloat = 0.6
    }

    // MARK: - IBOutlets
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var dateLabel: UILabel!

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
        backgroundColor = .white
        dateLabel.font = .body3
        dateLabel.textColor = .almostBlack
        dateLabel.alpha = Constants.dateOpacity
    }

    func configure(uiModel: ImageWithLabelUIModel) {
        iconImageView.image = uiModel.image
        dateLabel.text = uiModel.labelText
    }
}
