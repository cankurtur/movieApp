//
//  PointAndDetailsContainerView.swift
//  movieApp
//
//  Created by Can Kurtur on 10.09.2021.
//

import UIKit

class PointAndDetailsContainerView: UIView {
    @IBOutlet private weak var iconWithPointLabelView: IconWithPointLabel!
    @IBOutlet private weak var titleText: UILabel!
    @IBOutlet private weak var detailsText: UILabel!
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
        let view = self.nibInstantiate(autoResizingMask: [.flexibleHeight, .flexibleWidth])
        view.frame = self.bounds
        addSubview(view)
    }

    func configure(viewModel: PointAndDetailsContainerViewUIModel) {
        iconWithPointLabelView.configure(uiModel: viewModel.iconWithPointLabelView)
        titleText.text = viewModel.titleText
        detailsText.text = viewModel.detailsText
        separatorView.isHidden = !(viewModel.separator)
    }
}
