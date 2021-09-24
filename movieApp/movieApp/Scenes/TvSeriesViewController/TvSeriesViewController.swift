//
//  TvSeriesViewController.swift
//  movieApp
//
//  Created by Can Kurtur on 17.09.2021.
//

import UIKit

class TvSeriesViewController: UIViewController {
    // MARK: - Constants
    private struct Constants {
        static let largeTitleBarText: String = "TV Series"
        static let titleBarText: String = "Top Rated Series"
        static let limitForBarShowing: CGFloat = 107
        static let verticalCardCellIdentifier: String = "verticalCardIdentifier"
        static let verticalCardNibName: String = "VerticalCardCollectionViewCell"
    }

    // MARK: - IBOutlets
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var imageCollectionViewWithPD: ImageCollectionViewWithPointAndDetailsContainerView!
    @IBOutlet private weak var topRatedSeriesCollectionView: AutoSizedCollectionView!


    private var viewModel = TvSeriesViewModel()
    private var verticalCardViewUIModel: [VerticalCardViewWithImageAndDetailsUIModel]?
    private var tvID: Int?
    // MARK: - Business Logic
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
    }

    private func setupUI() {
        view.backgroundColor = .whiteTwo
        scrollView.delegate = self
        setupCollectionView()
    }

    private func setupBindings() {
        viewModel.getPopularTvSeries { sliderContents in
            self.configureSlider(model: sliderContents)
        }
        viewModel.getTopRatedTvSeries { verticalCardViewUIModel in
            self.verticalCardViewUIModel = verticalCardViewUIModel
            self.topRatedSeriesCollectionView.reloadData()
        }
    }

    private func configureSlider(model: [SliderContents]) {
        imageCollectionViewWithPD.configure(
            viewModel: ImageCollectionViewWithPointAndDetailsContainerViewUIModel(
                contents: model
            )
        )
    }

    private func setupCollectionView() {
        topRatedSeriesCollectionView.delegate = self
        topRatedSeriesCollectionView.dataSource = self
        topRatedSeriesCollectionView.register(UINib(nibName: Constants.verticalCardNibName, bundle: nil), forCellWithReuseIdentifier: Constants.verticalCardCellIdentifier)
        topRatedSeriesCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "test")
    }
}
// MARK: - UIScrollViewDelegate
extension TvSeriesViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let positiveScrollViewYConstant = -scrollView.contentOffset.y
        if positiveScrollViewYConstant < Constants.limitForBarShowing {
            navigationItem.title = Constants.titleBarText
        } else {
            navigationItem.title = Constants.largeTitleBarText
        }
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension TvSeriesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        verticalCardViewUIModel?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = topRatedSeriesCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.verticalCardCellIdentifier, for: indexPath)
                as? VerticalCardCollectionViewCell, let model = verticalCardViewUIModel else {
            return topRatedSeriesCollectionView.dequeueReusableCell(withReuseIdentifier: "test", for: indexPath)
        }
        cell.configure(with: model[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let model = verticalCardViewUIModel {
            let tvID = model[indexPath.row].id
            showDetailVC(id: tvID)
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension TvSeriesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 153, height: 310)
    }
}

extension TvSeriesViewController {
    func showDetailVC(id: Int) {
//        let detailVC = DetailsViewController()
//        detailVC.tvSeriesID = id
//        navigationController?.pushViewController(detailVC, animated: true)

        if let detailVC = UIStoryboard(name: "Details", bundle: nil).instantiateInitialViewController() as? DetailsViewController {
            detailVC.tvSeriesID = id
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}
