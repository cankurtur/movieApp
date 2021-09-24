//
//  ImageCollectionViewWithPointAndDetailsContainerView.swift
//  movieApp
//
//  Created by Can Kurtur on 11.09.2021.
//

import UIKit

class ImageCollectionViewWithPointAndDetailsContainerView: UIView {
    // MARK: - Constants
    struct Constants {
        static let customCollectionViewCellIdentifier: String = "customCollectionViewCell"
        static let customCollectionViewCellNibName: String = "CustomCollectionViewCell"
    }

    // MARK: - IBOutlets
    @IBOutlet private weak var imageCollectionView: UICollectionView!
    @IBOutlet private weak var pointsAndDetailsContainerView: PointAndDetailsContainerView!

    // MARK: - Properties
    private var imageArray: [UIImage]?
    private var currentImageNumber: Int = 0
    private var contentArray: [SliderContents]?

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
        let view = nibInstantiate(autoResizingMask: [.flexibleHeight, .flexibleHeight])
        view.frame = self.bounds
        addSubview(view)
        setupUICollectionView()
    }

    private func setupUICollectionView() {
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        imageCollectionView.register(
            UINib(nibName: Constants.customCollectionViewCellNibName, bundle: nil),
            forCellWithReuseIdentifier: Constants.customCollectionViewCellIdentifier
        )
    }

    func configure(viewModel: ImageCollectionViewWithPointAndDetailsContainerViewUIModel) {
        imageArray = viewModel.fetchImages()
        contentArray = viewModel.contents
        imageCollectionView.reloadData()
        
        if let safeContentArray = contentArray {
            let model = safeContentArray[0]
            pointsAndDetailsContainerView.configure(viewModel: model.pointAndDetails)
        }
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension ImageCollectionViewWithPointAndDetailsContainerView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imageArray?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = imageCollectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.customCollectionViewCellIdentifier,
            for: indexPath
        ) as? CustomCollectionViewCell else {
            return CustomCollectionViewCell()
        }
        if let safeContentArray = contentArray {
            let imagePosterPath = safeContentArray[indexPath .row].posterPath
            cell.configure(uiModel: FetchImageViewUIModel(imageLink: imagePosterPath))
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ImageCollectionViewWithPointAndDetailsContainerView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = imageCollectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0.0
    }

    // MARK: - UIScrollView
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let centerPoint = CGPoint(
            x: imageCollectionView.center.x + imageCollectionView.contentOffset.x,
            y: imageCollectionView.center.y + imageCollectionView.contentOffset.y
        )
        if let indexPathForCenter = (imageCollectionView?.indexPathForItem(at: centerPoint)?.row), let safeContentArray = contentArray {
            let model = safeContentArray[indexPathForCenter]
            pointsAndDetailsContainerView.configure(viewModel: model.pointAndDetails)
        }
    }
}
