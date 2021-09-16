//
//  VerticalCardViewWithImageAndDetails.swift
//  movieApp
//
//  Created by Can Kurtur on 16.09.2021.
//

import UIKit

class VerticalCardViewWithImageAndDetails: UIView {
    // MARK: - Constant
    struct Constants {
        static let cornerRadius: CGFloat = 8.0
    }

    // MARK: - IBOutlet
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var iconWithPointLabel: IconWithPointLabel!

    // MARK: - Business Logic
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
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
    }

    func configure(viewModel: VerticalCardViewWithImageAndDetailsUIModel) {
        imageView.image = viewModel.image
        titleLabel.text = viewModel.title
        iconWithPointLabel.configure(uiModel: viewModel.iconWithPointLabelUIModel)
    }
}
