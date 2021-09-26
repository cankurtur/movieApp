//
//  TvSeriesDetailsViewController.swift
//  movieApp
//
//  Created by Can Kurtur on 22.09.2021.
//

import UIKit

class TvSeriesDetailsViewController: UIViewController {
    // MARK: - Constants
    struct Constants {
        static let cornerRadius: CGFloat = 12
    }

    // MARK: - IBOutlets
    @IBOutlet private weak var posterImageView: FetchImageView!
    @IBOutlet private weak var iconWithPointLabelView: IconWithPointLabel!
    @IBOutlet private weak var titleAndDetailsView: TitleAndDetailsContainerView!
    @IBOutlet private weak var subjectLabel: UILabel!
    @IBOutlet private weak var seasonView: UIView!
    @IBOutlet private weak var seasonLabel: UILabel!
    @IBOutlet private weak var creatorsLabel: UILabel!
    @IBOutlet private weak var labelWithCircleImageView: LabelWithCircleImageView!

    // MARK: - Properties
    private var viewModel: TvSeriesDetailsViewModel = TvSeriesDetailsViewModel()
    var tvSeriesID: Int?

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        labelWithCircleImageView.someDelegate = self
//        setBackBarButtonCustom()
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

        seasonView.layer.cornerRadius = Constants.cornerRadius
        seasonView.layer.masksToBounds = true
        seasonView.backgroundColor = .deepGray

        seasonLabel.font = .season
        seasonLabel.textColor = .white

        creatorsLabel.font = .body1
        creatorsLabel.textColor = .almostBlack
    }

    private func configure() {
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
            self.seasonLabel.text = detailsUIModel.numberOfSeasons
            self.creatorsLabel.text = detailsUIModel.creators
            self.labelWithCircleImageView.configure(
                viewModel: LabelWithCircleImageViewUIModel(
                    titleText: detailsUIModel.castHeadline,
                    contents: detailsUIModel.cast
                )
            )
        }
    }
}

extension TvSeriesDetailsViewController: PersonID {
    func passPersonIDBack(id: Int) {
        showPeopleDetailsVC(personID: id)
    }
}

extension TvSeriesDetailsViewController {
    func showPeopleDetailsVC(personID: Int) {
        if let peopleDetailsVC = UIStoryboard(name: "PeopleDetails", bundle: nil).instantiateInitialViewController() as? PeopleDetailsViewController {
            peopleDetailsVC.personID = personID
            navigationController?.pushViewController(peopleDetailsVC, animated: true)
        }
    }
}

// extension TvSeriesDetailsViewController {
//    func setBackBarButtonCustom() {
//        let btnLeftMenu: UIButton = UIButton()
//        btnLeftMenu.setImage(UIImage(named: "clock"), for: UIControl.State())
//        btnLeftMenu.addTarget(self, action: #selector(TvSeriesDetailsViewController.onClcikBack), for: UIControl.Event.touchUpInside)
//        btnLeftMenu.frame = CGRect(x: 0, y: 0, width: 33 / 2, height: 27 / 2)
//        let barButton = UIBarButtonItem(customView: btnLeftMenu)
//        self.navigationItem.leftBarButtonItem = barButton
//
//    }
//
//    @objc func onClcikBack() {
//        _ = self.navigationController?.popViewController(animated: true)
//    }
// }
