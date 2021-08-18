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
        static let navigationBarHeight: CGFloat = 143
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
        filmTableView.delegate = self
        filmTableView.dataSource = self
        scrollView.delegate = self
        viewModel = MainViewModel()
        filmTableView.register(UINib(nibName: Constants.cellNibName, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
        tableViewHeightConstraint.constant = CGFloat(count * Constants.tableViewRowHeight)
        setupUI()
    }

    // MARK: - Business Logic
    func setupUI() {
        view.backgroundColor = .whiteTwo
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
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
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollViewYConstant = scrollView.contentOffset.y
        let positiveScrollViewYConstant = Constants.navigationBarHeight - (scrollViewYConstant + Constants.navigationBarHeight)

        if positiveScrollViewYConstant < Constants.limitForBarShowing {
            title = Constants.titleBarText
        } else {
            title = Constants.largeTitleBarText
        }
    }
}
