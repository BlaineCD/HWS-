//
//  Article.swift
//  SimpleNews
//
//  Created by Blaine Dannheisser on 6/1/22.
//

import Foundation

struct Article: Decodable, Identifiable, Comparable {
    let id: String
    var section: String
    var title: String
    var description: String
    var author: String
    var text: String
    var thumbnail: URL
    var image: URL
    var date: Date
    var url: URL

    // reverse sort
    static func <(lhs: Article, rhs: Article)  -> Bool {
        lhs.date > rhs.date
    }

    static let example = Article(id: "1", section: "News", title: "Hamilton Wins Championship", description: "Greatest Driver of all time!", author: "Krafty", text: "Blah Blah", thumbnail: URL(string: "https://dev/img/logo.png")!, image: URL(string:  "https://dev/img/logo.png")!, date: .now, url: URL(string: "https://www.hackingwithswift.com")!)
}
