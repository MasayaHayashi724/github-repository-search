//
//  SearchRepoVC.swift
//  github-repo-search
//
//  Created by Masaya Hayashi on 2017/05/23.
//  Copyright © 2017年 Masaya Hayashi. All rights reserved.
//

import UIKit

class SearchRepoVC: UIViewController {

    // - Properties

    fileprivate var repositories: [Repository] = [] {
        didSet {
            self.repoTableView.reloadData()
        }
    }

    // - User Interface

    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var repoTableView: UITableView!

    // - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SearchRepoVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repositories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = repositories[indexPath.row].fullName
        if let language = repositories[indexPath.row].language {
            cell.detailTextLabel?.text = language
        }
        return cell
    }
}
