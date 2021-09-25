//
//  MoviesDetailsViewController.swift
//  movieApp
//
//  Created by Can Kurtur on 25.09.2021.
//

import UIKit

class MoviesDetailsViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet private weak var posterImageView: FetchImageView!
    @IBOutlet private weak var iconWithPointLabelView: IconWithPointLabel!
    @IBOutlet private weak var titleAndDetailsView: TitleAndDetailsContainerView!
    @IBOutlet private weak var subjectLabel: UILabel!

    // MARK: - Properties
    private var viewModel: MoviesDetailsViewModel = MoviesDetailsViewModel()
    var moviesID: Int?

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupNavigationBar()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configure()
    }
    
    // MARK: - Business Logic
    private func setupNavigationBar() {
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    private func setupUI() {
        view.backgroundColor = .white
        subjectLabel.font = .body1
        subjectLabel.textColor = .almostBlack
    }

    private func configure() {
        guard let moviesID = moviesID else { return }

        viewModel.getMoviesDetails(id: moviesID) { moviesDetailsUIModel in
            self.posterImageView.configure(viewModel: FetchImageViewUIModel(imageLink: moviesDetailsUIModel.posterPath))
            self.iconWithPointLabelView.configure(uiModel: IconWithPointLabelUIModel(pointNumberText: moviesDetailsUIModel.voteAverage))
            self.titleAndDetailsView.configure(
                with: TitleAndDetailsContainerViewUIModel(
                    titleText: moviesDetailsUIModel.title,
                    detailsText: moviesDetailsUIModel.details,
                    durationViewUIModel: ImageWithLabelUIModel(image: .clock, labelText: moviesDetailsUIModel.runtime),
                    typeViewUIModel: ImageWithLabelUIModel(image: .calendarIcon, labelText: moviesDetailsUIModel.releaseDate)
                )
            )
            self.subjectLabel.text = moviesDetailsUIModel.overview
        }
    }
}
