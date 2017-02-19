//
//  Articles.swift
//  Vote
//
//  Created by Simone on 2/18/17.
//  Copyright © 2017 C4Q. All rights reserved.
//
import Foundation

class Article {
    var webURL: String?
    var snippet: String?
    var source: String?
    var pubDate: String?
    let headline: String?
    
    init?(from dict: [String:Any]) {
        if let webURL = dict["web_url"] as? String,
            let snippet = dict["snippet"] as? String,
            let source = dict["source"] as? String,
            let pubDate = dict["pub_date"] as? String {
            self.webURL = webURL
            self.snippet = snippet
            self.source = source
            self.pubDate = pubDate
        } else {
            print("article detail error")
            return nil
        }
        
        if let headlineNews = dict["headline"] as? [String: Any],
            let headline = headlineNews["main"] as? String {
            self.headline = headline
        } else {
            print("error on headline")
            return nil
        }
    }
    
    private func getArticles(from arr: [[String:Any]]) -> [Article] {
        var articles = [Article]()
        for articleDict in arr {
            if let article = Article(from: articleDict) {
                articles.append(article)
            }
        }
        return articles
        
    }
    
}
