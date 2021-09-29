//
//  SearchViewController.swift
//  movieApp
//
//  Created by Can Kurtur on 27.09.2021.
//

import UIKit

class SearchViewController: UIViewController {
    private struct Constants {
        static let largeTitleBarText: String = "Search"
        static let cellNibName: String = "SearchCardTableViewCell"
        static let cellIdentifier: String = "searchCardTableViewCell"
    }

    @IBOutlet private weak var miniSearchView: UIView!
    @IBOutlet private weak var searchTextField: UITextField!
    @IBOutlet private weak var cardTableView: AutoSizedTableView!
    @IBOutlet private weak var xButton: UIButton!
    @IBOutlet private weak var cancelButton: UIButton!

    var viewModel: SearchViewModel?
    var content: [SearchCardViewModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupCardTableView()
        searchTextField.delegate = self
    }

    private func setupUI() {
        title = Constants.largeTitleBarText
        view.backgroundColor = .white

        miniSearchView.layer.cornerRadius = 8
        miniSearchView.backgroundColor = .white
    }
    private func setupCardTableView() {
        cardTableView.delegate = self
        cardTableView.dataSource = self
        cardTableView.register(UINib(nibName: Constants.cellNibName, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
    }

    func setupBindings() {
        viewModel?.getMultiSearch(query: "Game", completion: { searchCardViewArray in
            self.content = searchCardViewArray
            self.cardTableView.reloadData()
        })
    }

    @IBAction private func xButtonPressed() {
    }
    @IBAction private func cancelButtonPressed() {
        setupBindings()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        content?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let content = content, let cell = cardTableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier)
                as? SearchCardTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(viewModel: content[indexPath.row])
        return cell
    }
}

extension SearchViewController: UITextFieldDelegate {
}
