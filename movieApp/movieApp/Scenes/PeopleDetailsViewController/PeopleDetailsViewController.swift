//
//  PeopleDetailsViewController.swift
//  movieApp
//
//  Created by Can Kurtur on 26.09.2021.
//

import UIKit

class PeopleDetailsViewController: UIViewController {
    @IBOutlet private weak var posterImage: FetchImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var bioLabel: UILabel!
    @IBOutlet private weak var bornLabel: UILabel!
    @IBOutlet private weak var seeFullBioButton: UIButton!

    private var viewModel: PeopleDetailsViewModel = PeopleDetailsViewModel()
    var personID: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configure()
    }

    private func setupUI() {
        view.backgroundColor = .white

        nameLabel.font = .headline2
        nameLabel.textColor = .almostBlack

        bioLabel.font = .body1
        bioLabel.textColor = .almostBlack

        bornLabel.font = .body1
        bornLabel.textColor = .almostBlack
}

    private func configure() {
        guard let personID = personID else { return }

        viewModel.getPeopleDetails(id: personID) { peopleDetailsUIModel in
            self.posterImage.configure(viewModel: FetchImageViewUIModel(imageLink: peopleDetailsUIModel.profilePath))
            self.nameLabel.text = peopleDetailsUIModel.nameText
            self.bioLabel.text = peopleDetailsUIModel.bioText
            self.bornLabel.text = peopleDetailsUIModel.bornText
            self.seeFullBioButton.isHidden = peopleDetailsUIModel.bioButtonIsHide
        }
    }
    @IBAction private func seeButtonPressed() {
        bioLabel.heightAnchor.constraint(equalToConstant: 500).isActive = true
    }
}
