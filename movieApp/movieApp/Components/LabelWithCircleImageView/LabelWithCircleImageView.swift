//
//  LabelWithCircleImageView.swift
//  movieApp
//
//  Created by Can Kurtur on 24.09.2021.
//

import UIKit

class LabelWithCircleImageView: UIView {
    // MARK: - Constants
    private struct Constants {
        static let circleImagesCollectionViewIdentifier: String = "circleImageCell"
        static let circleImagesCollectionViewNibName: String = "CircleImageCollectionViewCell"
    }

    // MARK: - IBOutlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var circleImagesCollectionView: UICollectionView!

    // MARK: - Properties
    var model: LabelWithCircleImageViewUIModel?

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
        let view = nibInstantiate(autoResizingMask: [.flexibleHeight, .flexibleWidth])
        view.frame = self.bounds
        addSubview(view)
        setupUI()
        setupUICollectionView()
    }

    private func setupUI() {
        titleLabel.font = .headline2
        titleLabel.textColor = . almostBlack
    }

    private func setupUICollectionView() {
        circleImagesCollectionView.delegate = self
        circleImagesCollectionView.dataSource = self
        circleImagesCollectionView.register(
            UINib(nibName: Constants.circleImagesCollectionViewNibName, bundle: nil),
            forCellWithReuseIdentifier: Constants.circleImagesCollectionViewIdentifier
        )
    }

    func configure(viewModel: LabelWithCircleImageViewUIModel) {
        self.model = viewModel
        titleLabel.text = viewModel.titleText
        circleImagesCollectionView.reloadData()
    }
}
// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension LabelWithCircleImageView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model?.contents.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = circleImagesCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.circleImagesCollectionViewIdentifier, for: indexPath)
                as? CircleImageCollectionViewCell, let model = model else {
            return UICollectionViewCell()
        }
        let currentRowText = model.contents[indexPath.row].text
        let currentRowPoster = model.contents[indexPath.row].posterPath

        cell.configure(text: currentRowText, imageLink: FetchImageViewUIModel(imageLink: currentRowPoster))
        return cell
    }
}
// MARK: - UICollectionViewDelegateFlowLayout
extension LabelWithCircleImageView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 100, height: 100)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
}
