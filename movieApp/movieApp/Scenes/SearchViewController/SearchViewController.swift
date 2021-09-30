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

    private func fetchCardObject(query: String) {
        viewModel.getMultiSearch(query: query) { searchCardViewModelArray in
            self.content = searchCardViewModelArray
            self.cardTableView.reloadData()
        }
    }


    @IBAction private func xButtonPressed() {
        searchTextField.text = ""
        content = []
        cardTableView.reloadData()
    }
    @IBAction private func cancelButtonPressed() {
        searchTextField.text = ""
        content = []
        cardTableView.reloadData()
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let content = content {
            let id = content[indexPath.row].id
            let mediaType = content[indexPath.row].mediaType

            switch mediaType {
            case .movieType:
                showMoviesDetailVC(id: id)
            case .tvType:
                showTvSeriesDetailVC(id: id)
            case .personType:
                showPeopleDetailsVC(personID: id)
            }
        }
    }
}

extension SearchViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        fetchCardObject(query: textField.text ?? "")
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        true
    }
}

extension SearchViewController {
    private func showTvSeriesDetailVC(id: Int) {
        if let tvSeriesDetailsVC = UIStoryboard(name: "TvSeriesDetails", bundle: nil).instantiateInitialViewController() as? TvSeriesDetailsViewController {
            tvSeriesDetailsVC.tvSeriesID = id
            navigationController?.pushViewController(tvSeriesDetailsVC, animated: true)
        }
    }

    private func showMoviesDetailVC(id: Int) {
        if let moviesDetailVC = UIStoryboard(name: "MoviesDetails", bundle: nil).instantiateInitialViewController() as? MoviesDetailsViewController {
            moviesDetailVC.moviesID = id
            navigationController?.pushViewController(moviesDetailVC, animated: true)
        }
    }

    private func showPeopleDetailsVC(personID: Int) {
        if let peopleDetailsVC = UIStoryboard(name: "PeopleDetails", bundle: nil).instantiateInitialViewController() as? PeopleDetailsViewController {
            peopleDetailsVC.personID = personID
            navigationController?.pushViewController(peopleDetailsVC, animated: true)
        }
    }
}
