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

    // MARK: - IBOutlet
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
        self.layer.cornerRadius = Constants.cornerRadius
        backgroundColor = UIColor.electricBlue
        pointLabel.font = UIFont.point
        pointLabel.textColor = UIColor.white
    }

    func configure(UIModel: IconWithPointLabelUIModel) {
        iconImageView.image = UIImage(named: UIModel.iconName)
        pointLabel.text = UIModel.pointNumberText
    }
}
