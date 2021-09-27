//
//  MainViewController.swift
//  movieApp
//
//  Created by Can Kurtur on 9.08.2021.
//

import UIKit

class MainViewController: UIViewController {
    private struct Constants {
        static let largeTitleBarText: String = "Movies"
        static let titleBarText: String = "Popular Movies"
        static let cellIdentifier: String = "customFilmCell"
        static let cellNibName: String = "CustomTableViewCell"
        static let limitForBarShowing: CGFloat = 107
        static let tableViewRowHeight: Double = 120
    }
    // MARK: - IBOutlet
    @IBOutlet private weak var filmTableView: UITableView!
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var headlineLabel: UILabel!
    @IBOutlet private weak var imageCollectionViewAndDetails: ImageCollectionViewWithPointAndDetailsContainerView!

    // MARK: - Properties
    private var viewModel: MainViewModel = MainViewModel()
    private var count: Double = 20
    private var cardViewUIModel: [CardViewWithImageAndDetailsUIModel]?

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
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
            self.count = Double(cardViewUIModel.count)
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
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
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
}

// MARK: - UIScrollViewDelegate
extension MainViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let positiveScrollViewYConstant = -scrollView.contentOffset.y
        if positiveScrollViewYConstant < Constants.limitForBarShowing {
            title = Constants.titleBarText
        } else {
            title = Constants.largeTitleBarText
        }
    }
}
