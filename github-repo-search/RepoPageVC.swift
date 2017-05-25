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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    // - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.activityIndicator.hidesWhenStopped = true
        self.activityIndicator.isHidden = true
        guard let url = url else { return }
        self.repoPageWebView.loadRequest(URLRequest(url: url))
    }
}

extension RepoPageVC: UIWebViewDelegate {
    func webViewDidStartLoad(_ webView: UIWebView) {
        activityIndicator.startAnimating()
    }

    func webViewDidFinishLoad(_ webView: UIWebView) {
        activityIndicator.stopAnimating()
    }
}
