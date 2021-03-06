//
//  IconWithPointLabel.swift
//  movieApp
//
//  Created by Can Kurtur on 9.08.2021.
//

import UIKit

class IconWithPointLabel: UIView {
    // MARK: - Constants
    private struct Constants {
        static let pointLabelTextSize: CGFloat = 10
        static let cornerRadius: CGFloat = 11
    }

    // MARK: - IBOutlets
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var pointLabel: UILabel!

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
        backgroundColor = .electricBlue
        pointLabel.font = .point
        pointLabel.textColor = .white
    }

    func configure(uiModel: IconWithPointLabelUIModel) {
        iconImageView.image = uiModel.icon
        pointLabel.text = uiModel.pointNumberText
        pointLabel.font = pointLabel.font.withSize(uiModel.fontSize)
    }
}
