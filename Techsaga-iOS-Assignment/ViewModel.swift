//
//  ViewModel.swift
//  Techsaga-iOS-Assignment
//
//  Created by Harsh Kumar Agrawal on 25/02/23.
//


import Foundation
import UIKit

protocol ViewModelDelegate {
    func reloadTableView()
}

class ViewModel {
    
    private var articleList: [ArticleData]?
    var delegate: ViewModelDelegate?
    
    func makeNetworkCall() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            NetworkManager.shared.apiCall() { [weak self] result in
                
                guard let strongSelf = self else { return }
                
                switch result {
                case .success(let response):
                    strongSelf.articleList = response.articles
                    strongSelf.delegate?.reloadTableView()
                    
                case .failure(.unableToParse):
                    print("unable to parse")
                    
                case .failure(.apiError):
                    print("unable to parse")
                }
            }
        }
    }
    
    func getarticleCount() -> Int{
        return articleList?.count ?? 0
    }
    func getArticle(_ atIndex: Int) -> ArticleData? {
        return articleList?[atIndex]
    }
}
