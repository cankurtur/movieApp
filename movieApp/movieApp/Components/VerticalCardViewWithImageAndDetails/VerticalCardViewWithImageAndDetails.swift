//
//  VerticalCardViewWithImageAndDetails.swift
//  movieApp
//
//  Created by Can Kurtur on 19.09.2021.
//

import UIKit

class VerticalCardViewWithImageAndDetails: UIView {
    // MARK: - Constants
    struct Constants {
        static let cornerRadius: CGFloat = 8.0
    }

    // MARK: - IBOutlets
    @IBOutlet private weak var imageView: FetchImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var iconWithPointLabel: IconWithPointLabel!

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
    }

    func configure(viewModel: VerticalCardViewWithImageAndDetailsUIModel) {
        imageView.configure(viewModel: viewModel.posterPath)
        titleLabel.text = viewModel.title
        iconWithPointLabel.configure(uiModel: viewModel.iconWithPointLabelUIModel)
    }
}
