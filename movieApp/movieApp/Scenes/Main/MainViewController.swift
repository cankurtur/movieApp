//
//  MainViewController.swift
//  movieApp
//
//  Created by Can Kurtur on 9.08.2021.
//

import UIKit

class MainViewController: UIViewController {
    struct Constants {
        static let largeTitleBarText: String = "Movies"
        static let titleBarText: String = "Popular Movies"
        static let cellIdentifier: String = "customFilmCell"
        static let limitForBarShowing: CGFloat = 107
        static let tableViewRowHeight: Double = 120
    }
    // MARK: - IBOutlet
    @IBOutlet private weak var filmTableView: UITableView!
    @IBOutlet private weak var tableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var headlineLabel: UILabel!

    // MARK: - Properties
    private var viewModel: MainViewModel!
    private var count: Double = 10

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupUITableView()
        setupUIScrollView()
        viewModel = MainViewModel()
    }

    // MARK: - Business Logic
    func setupUI() {
        view.backgroundColor = UIColor.whiteTwo
        headlineLabel.font = UIFont.headline2
        headlineLabel.textColor = UIColor.almostBlack
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func setupUITableView() {
        filmTableView.delegate = self
        filmTableView.dataSource = self
        tableViewHeightConstraint.constant = CGFloat(count * Constants.tableViewRowHeight)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = filmTableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier) as? CustomTableViewCell, let model = viewModel else {
            return UITableViewCell()
        }
        cell.configure(with: model.cardViewWithImageAndDetailsData)
        return cell
    }
}

// MARK: - UIScrollViewDelegate
extension MainViewController: UIScrollViewDelegate {
    func setupUIScrollView() {
        scrollView.delegate = self
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollViewStartPoint = scrollView.contentOffset.y
        let scrollViewYConstant = 143 - (scrollViewStartPoint + 143)

        if scrollViewYConstant < Constants.limitForBarShowing {
            title = Constants.titleBarText
        } else {
            title = Constants.largeTitleBarText
        }
    }
}
