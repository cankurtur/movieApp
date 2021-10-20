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

    // MARK: - Properties
    private var viewModel = TvSeriesViewModel()
    private var verticalCardViewUIModel: [VerticalCardViewWithImageAndDetailsUIModel]?
    private var tvID: Int?

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        imageCollectionViewWithPD.delegate = self
        setupUI()
        setupBindings()
    }

    // MARK: - Business Logic
    private func setupUI() {
        scrollView.delegate = self
        view.backgroundColor = .whiteTwo
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
        topRatedSeriesCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ifNot")
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
            return topRatedSeriesCollectionView.dequeueReusableCell(withReuseIdentifier: "ifNot", for: indexPath)
        }
        cell.configure(with: model[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let model = verticalCardViewUIModel {
            let tvID = model[indexPath.row].id
            showTvSeriesDetailVC(id: tvID)
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

// MARK: - MoviesAndTvSeriesID
extension TvSeriesViewController: MoviesAndTvSeriesIDDelegate {
    func passIDBack(id: Int) {
        showTvSeriesDetailVC(id: id)
    }

    private func showTvSeriesDetailVC(id: Int) {
        if let tvSeriesDetailsVC = UIStoryboard(name: "TvSeriesDetails", bundle: nil).instantiateInitialViewController() as? TvSeriesDetailsViewController {
            tvSeriesDetailsVC.tvSeriesID = id
            navigationController?.pushViewController(tvSeriesDetailsVC, animated: true)
        }
    }
}
