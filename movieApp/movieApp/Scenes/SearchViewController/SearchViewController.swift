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


    @IBOutlet private weak var searchTextField: UITextField!
    @IBOutlet private weak var cardTableView: AutoSizedTableView!
    @IBOutlet private weak var xButton: UIButton!
    @IBOutlet private weak var cancelButton: UIButton!
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var emptyView: UIView!

    var viewModel: SearchViewModel = SearchViewModel()
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
        emptyView.backgroundColor = .white
        contentView.backgroundColor = .white

        emptyView.isHidden = true
        searchTextField.leftView?.backgroundColor = .black
    }
    private func setupCardTableView() {
        cardTableView.delegate = self
        cardTableView.dataSource = self
        cardTableView.register(UINib(nibName: Constants.cellNibName, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
    }


    @IBAction private func xButtonPressed() {
        searchTextField.text = ""
    }
    @IBAction private func cancelButtonPressed() {
        searchTextField.endEditing(true)
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
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (textField.text?.isEmpty) != nil {
            textField.placeholder = "Type something"
        } else {
            guard let searchText = textField.text else { return }
            viewModel.getMultiSearch(query: searchText) { searchCardViewArray in
                self.content = searchCardViewArray
                self.cardTableView.reloadData()
            }
            searchTextField.text = ""
            emptyView.isHidden = false
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        true
    }
}
