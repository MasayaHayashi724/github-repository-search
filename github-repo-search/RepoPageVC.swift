//
//  RepoPageVC.swift
//  github-repo-search
//
//  Created by Masaya Hayashi on 2017/05/23.
//  Copyright © 2017年 Masaya Hayashi. All rights reserved.
//

import UIKit

class RepoPageVC: UIViewController {

    // - Properties

    var url: URL?

    // - User Interface

    @IBOutlet private weak var repoPageWebView: UIWebView!

    // - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let url = url else { return }
        self.repoPageWebView.loadRequest(URLRequest(url: url))
    }
}
