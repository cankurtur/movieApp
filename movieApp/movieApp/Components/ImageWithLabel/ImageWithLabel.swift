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

    // MARK: - IBOutlet
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
        backgroundColor = UIColor.white
        dateLabel.font = UIFont.body2
        dateLabel.textColor = UIColor.almostBlack
    }

    func configure(UIModel: ImageWithLabelUIModel) {
        iconImageView.image = UIImage(named: UIModel.imageName)
        dateLabel.text = UIModel.labelText
        dateLabel.alpha = Constants.dateOpacity
    }
}
