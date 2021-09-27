//
//  SearchCardView.swift
//  movieApp
//
//  Created by Can Kurtur on 27.09.2021.
//

import UIKit

class SearchCardView: UIView {
    @IBOutlet private weak var cardImage: FetchImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var detailsLabel: UILabel!
    @IBOutlet private weak var imageWithLabelView: ImageWithLabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        let view = nibInstantiate(autoResizingMask: [.flexibleHeight, .flexibleWidth])
        view.frame = self.bounds
        addSubview(view)
        setupUI()
    }

    private func setupUI() {
        backgroundColor = .white

        titleLabel.font = .headline4
        titleLabel.textColor = .almostBlack

        detailsLabel.font = .body2
        detailsLabel.textColor = .almostBlack
    }

    func configure(viewModel: SearchCardViewModel?) {
        guard let model = viewModel else { return }

        cardImage.configure(viewModel: FetchImageViewUIModel(imageLink: model.posterPath))
        titleLabel.text = model.titleText
        detailsLabel.text = model.detailsText
        imageWithLabelView.configure(uiModel: model.imageWithLabelViewModel)
    }
}
