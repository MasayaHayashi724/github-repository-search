//
//  GitHubAPI.swift
//  github-repo-search
//
//  Created by Masaya Hayashi on 2017/05/23.
//  Copyright © 2017年 Masaya Hayashi. All rights reserved.
//

import Foundation

extension URL {
    static let searchRepoURLString: String = "https://api.github.com/search/repositories?"
    static let sortString: String = "&sort=stars&order=desc"
}

enum HTTPMethod: String {
    case GET
}

enum APIError: Error {
    case emptyBody
    case unexpectedResponseType
}

struct SearchResult: JSONDecodable {
    let items: [Repository]

    init(JSON: JSONObject) throws {
        self.items = try JSON.get("items")
    }
}

struct Repository: JSONDecodable {
    let htmlUrl: URL
    let fullName: String
    let language: String

    init(JSON: JSONObject) throws {
        self.htmlUrl = try JSON.get("html_url")
        self.fullName = try JSON.get("full_name")
        self.language = try JSON.get("language")
    }
}
