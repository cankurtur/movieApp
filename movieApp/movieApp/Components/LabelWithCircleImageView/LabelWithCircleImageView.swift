//
//  LabelWithCircleImageView.swift
//  movieApp
//
//  Created by Can Kurtur on 24.09.2021.
//

import UIKit

class LabelWithCircleImageView: UIView {
    private struct Constants {
        static let collectionViewIdentifier: String = "circleImageCell"
    }

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var circleImagesCollectionView: UICollectionView!

    var model: LabelWithCircleImageViewUIModel?

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
        titleLabel.font = .headline2
        titleLabel.textColor = . almostBlack
    }

    func configure(viewModel: LabelWithCircleImageViewUIModel) {
        self.model = viewModel
        titleLabel.text = viewModel.titleText
    }
}

extension LabelWithCircleImageView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model?.contents.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = circleImagesCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.collectionViewIdentifier, for: indexPath)
                as? CircleImageCollectionViewCell, let model = model else {
            return UICollectionViewCell()
        }
        let currentRowText = model.contents[indexPath.row].text
        let currentRowPoster = model.contents[indexPath.row].posterPath

        cell.configure(text: currentRowText, imageLink: FetchImageViewUIModel(imageLink: currentRowPoster))
        return cell
    }
}

extension LabelWithCircleImageView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 100, height: 100)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
}
