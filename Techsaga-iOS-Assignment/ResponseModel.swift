//
//  ResponseModel.swift
//  Techsaga-iOS-Assignment
//
//  Created by Harsh Kumar Agrawal on 25/02/23.
//
import Foundation

enum NetworkError: Error {
    case unableToParse
    case apiError
}

struct NewsData: Codable {
    var status: String
    var articles: [ArticleData]
}

struct ArticleData: Codable {
    var publishedAt: String
    //var urlToImage: String
    var author: String
    var source: Source
    var title: String
    var description: String
}

struct Source: Codable {
    var id: String
    var name: String
}
