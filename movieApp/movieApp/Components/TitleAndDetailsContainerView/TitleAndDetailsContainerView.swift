//
//  TitleAndDetailsContainerView.swift
//  movieApp
//
//  Created by Can Kurtur on 22.09.2021.
//

import UIKit

class TitleAndDetailsContainerView: UIView {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var detailsLabel: UILabel!
    @IBOutlet private weak var durationView: ImageWithLabel!
    @IBOutlet private weak var stackViewSeparatorView: UIView!
    @IBOutlet private weak var typeView: ImageWithLabel!
    @IBOutlet private weak var separatorView: UIView!

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
        titleLabel.font = .headline2
        titleLabel.textColor = .almostBlack
        detailsLabel.font = . subtitle1
        detailsLabel.textColor = .almostBlack
        stackViewSeparatorView.backgroundColor = .separator
        separatorView.backgroundColor = .separator
    }

    func configure(with viewModel: TitleAndDetailsContainerViewUIModel?) {
        guard let model = viewModel else { return }

        titleLabel.text = model.titleText
        detailsLabel.text = model.detailsText
        durationView.configure(uiModel: model.durationViewUIModel)
        typeView.configure(uiModel: model.typeViewUIModel)
        separatorView.isHidden = model.separatorIsHidden
    }
}
