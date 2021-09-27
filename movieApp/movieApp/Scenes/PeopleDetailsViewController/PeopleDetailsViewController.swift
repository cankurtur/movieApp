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
    @IBOutlet private weak var bornText: UILabel!
    @IBOutlet private weak var bornLabel: UILabel!
    @IBOutlet private weak var seeFullBioButton: UIButton!

    @IBOutlet private weak var bioLabelHeightConstraint: NSLayoutConstraint!
    var heightConstraint: NSLayoutConstraint?

    private var viewModel: PeopleDetailsViewModel = PeopleDetailsViewModel()
    var personID: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configure()
//        setupSeeFullBioButton()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupSeeFullBioButton()
    }

    private func setupUI() {
        view.backgroundColor = .white

        nameLabel.font = .headline2
        nameLabel.textColor = .almostBlack

        bioLabel.font = .body1
        bioLabel.textColor = .almostBlack

        bornText.font = .headline5
        bornText.textColor = .almostBlack

        bornLabel.font = .body1
        bornLabel.textColor = .almostBlack
    }
    private func setupSeeFullBioButton() {
        if bioLabel.frame.height < 85 {
            seeFullBioButton.isHidden = true
        } else {
            seeFullBioButton.isHidden = false
//            heightConstraint = bioLabel.heightAnchor.constraint(equalToConstant: 85)
//            heightConstraint?.isActive = true
            seeFullBioButton.setTitle("See full bio >>", for: .normal)
        }
    }

    private func configure() {
        guard let personID = self.personID else { return }

        self.viewModel.getPeopleDetails(id: personID) { peopleDetailsUIModel in
            self.posterImage.configure(viewModel: FetchImageViewUIModel(imageLink: peopleDetailsUIModel.profilePath))
            self.nameLabel.text = peopleDetailsUIModel.nameText
            self.bioLabel.text = peopleDetailsUIModel.bioText
            self.bornText.isHidden = peopleDetailsUIModel.bornLabelIsHide
            self.bornLabel.text = peopleDetailsUIModel.bornText
        }
    }

    @IBAction private func seeButtonPressed() {
        if bioLabelHeightConstraint.constant == 85 {
//            bioLabel.removeConstraint(heightConstraint)
            bioLabelHeightConstraint.constant = 2000
            seeFullBioButton.setTitle("<< Close full bio", for: .normal)
        } else {
            seeFullBioButton.setTitle("See full bio >>", for: .normal)
//            heightConstraint = bioLabel.heightAnchor.constraint(equalToConstant: 85)
            bioLabelHeightConstraint.constant = 85
//            heightConstraint?.isActive = true
        }
    }
    
    @IBAction private func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
}
