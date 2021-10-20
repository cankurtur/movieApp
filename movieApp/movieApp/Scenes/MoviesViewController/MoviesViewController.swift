//
//  MoviesViewController.swift
//  movieApp
//
//  Created by Can Kurtur on 9.08.2021.
//

import UIKit

class MoviesViewController: UIViewController {
    // MARK: - Constants
    private struct Constants {
        static let largeTitleBarText: String = "Movies"
        static let titleBarText: String = "Popular Movies"
        static let cellIdentifier: String = "customFilmCell"
        static let cellNibName: String = "CustomTableViewCell"
        static let limitForBarShowing: CGFloat = 107
        static let tableViewRowHeight: Double = 120
    }
    // MARK: - IBOutlets
    @IBOutlet private weak var filmTableView: UITableView!
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var headlineLabel: UILabel!
    @IBOutlet private weak var imageCollectionViewAndDetails: ImageCollectionViewWithPointAndDetailsContainerView!

    // MARK: - Properties
    private var viewModel: MoviesViewModel = MoviesViewModel()
    private var cardViewUIModel: [CardViewWithImageAndDetailsUIModel]?

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        imageCollectionViewAndDetails.delegate = self
        setupUI()
        setupBinding()
    }

    // MARK: - Business Logic
    private func setupUI() {
        scrollView.delegate = self
        view.backgroundColor = .whiteTwo
        self.setupTableView()
    }

    private func setupBinding() {
        viewModel.getPopularMovies { cardViewUIModel in
            self.cardViewUIModel = cardViewUIModel
            self.filmTableView.reloadData()
        }

        viewModel.getNowPlayingMovies { sliderContents in
            self.configureSliderView(content: sliderContents)
        }
    }

    private func setupTableView() {
        filmTableView.delegate = self
        filmTableView.dataSource = self
        filmTableView.register(UINib(nibName: Constants.cellNibName, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
    }

    private func configureSliderView(content: [SliderContents]) {
        imageCollectionViewAndDetails.configure(
            viewModel: ImageCollectionViewWithPointAndDetailsContainerViewUIModel(
                contents: content 
            )
        )
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cardViewUIModel?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = filmTableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier) as? CustomTableViewCell, let model = cardViewUIModel else {
            return UITableViewCell()
        }
        cell.configure(with: model[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let model = cardViewUIModel {
            let moviesID = model[indexPath.row].id
            showMoviesDetailVC(id: moviesID)
        }
    }
}

// MARK: - UIScrollViewDelegate
extension MoviesViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let positiveScrollViewYConstant = -scrollView.contentOffset.y
        if positiveScrollViewYConstant < Constants.limitForBarShowing {
            navigationItem.title = Constants.titleBarText
        } else {
            navigationItem.title = Constants.largeTitleBarText
        }
    }
}

// MARK: - MoviesAndTvSeriesID
extension MoviesViewController: MoviesAndTvSeriesIDDelegate {
    func passIDBack(id: Int) {
        showMoviesDetailVC(id: id)
    }

    private func showMoviesDetailVC(id: Int) {
        if let moviesDetailVC = UIStoryboard(name: "MoviesDetails", bundle: nil).instantiateInitialViewController() as? MoviesDetailsViewController {
            moviesDetailVC.moviesID = id
            navigationController?.pushViewController(moviesDetailVC, animated: true)
        }
    }
}
