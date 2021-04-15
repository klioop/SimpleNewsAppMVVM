//
//  Article.swift
//  NewsAppMVVM
//
//  Created by klioop on 2021/04/15.
//

struct ArticlesList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    
    let title: String
    let description: String?
}

extension ArticlesList {
    static var empty: ArticlesList {
        return ArticlesList(articles: [Article(title: "Faild to fetch news", description: "Something Wrong in Request to the server!")])
    }
}


