//
//  MainViewController.swift
//  movieApp
//
//  Created by Can Kurtur on 9.08.2021.
//

import UIKit

class MainViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet private weak var filmTableView: UITableView!

    // MARK: - Properties
    var viewModel: MainViewModel!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Moviessss"
//        navigationController?.navigationBar.
//        navigationController?.title = "Movies"
//        navigationController?.navigationBar.barTintColor = UIColor.vibrantBlue
        filmTableView.delegate = self
        filmTableView.dataSource = self
        viewModel = MainViewModel()
        // Do any additional setup after loading the view.
    }
    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = filmTableView.dequeueReusableCell(withIdentifier: "customFilmCell") as? CustomTableViewCell, let model = viewModel else {
            return UITableViewCell()
        }
        cell.configure(with: model.cardViewWithImageAndDetailsData)
        return cell
    }
}
