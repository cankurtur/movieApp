//
//  TvSeriesDetailsViewController.swift
//  movieApp
//
//  Created by Can Kurtur on 22.09.2021.
//

import UIKit

class TvSeriesDetailsViewController: UIViewController {
    struct Constants {
        static let cornerRadius: CGFloat = 12
    }

    @IBOutlet private weak var posterImageView: FetchImageView!
    @IBOutlet private weak var iconWithPointLabelView: IconWithPointLabel!
    @IBOutlet private weak var titleAndDetailsView: TitleAndDetailsContainerView!
    @IBOutlet private weak var subjectLabel: UILabel!
    @IBOutlet private weak var seasonView: UIView!
    @IBOutlet private weak var seasonLabel: UILabel!

    private var viewModel: TvSeriesDetailsViewModel = TvSeriesDetailsViewModel()
    var tvSeriesID: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configure()
    }

    private func setupNavigationBar() {
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    private func setupUI() {
        view.backgroundColor = .white
        subjectLabel.font = .body1
        subjectLabel.textColor = .almostBlack

        seasonView.layer.cornerRadius = Constants.cornerRadius
        seasonView.layer.masksToBounds = true
        seasonView.backgroundColor = .deepGray

        seasonLabel.font = .season
        seasonLabel.textColor = .white
    }

    func configure() {
        guard let tvID = tvSeriesID else { return }
        viewModel.getTvSeriesDetails(id: tvID) { detailsUIModel in
            self.posterImageView.configure(viewModel: FetchImageViewUIModel(imageLink: detailsUIModel.posterPath))
            self.iconWithPointLabelView.configure(uiModel: IconWithPointLabelUIModel(pointNumberText: detailsUIModel.voteAverage))
            self.titleAndDetailsView.configure(
                with: TitleAndDetailsContainerViewUIModel(
                    titleText: detailsUIModel.name,
                    detailsText: detailsUIModel.details,
                    durationViewUIModel: ImageWithLabelUIModel(image: .clock, labelText: detailsUIModel.episodeRunTime),
                    typeViewUIModel: ImageWithLabelUIModel(image: .calendarIcon, labelText: detailsUIModel.seriesRunTime),
                    separatorIsHidden: false
                )
            )
            self.subjectLabel.text = detailsUIModel.overview
            self.seasonLabel.isHidden = false
            self.seasonLabel.text = detailsUIModel.numberOfSeasons
        }
    }
}
