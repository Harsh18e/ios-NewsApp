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
    
    private var articleList: [ArticleData]? {
        didSet {
            guard let articleList = articleList else { return }
            for i in articleList {
                guard let urlString = i.urlToImage else {
                    bgImages.append(UIImage(named: "news-image")!)
                    continue
                }
                downloadImage(from: URL(string: urlString)!)
            }
        }
    }
    var bgImages = [UIImage]()
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
    
    func downloadImage(from url: URL)
    {
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard error == nil else {
                print("error occured !!")
                return
            }
            guard let imageData = data, let image = UIImage(data: imageData) else {
                    print("Error converting image data to UIImage")
                    return
                }
            self.bgImages.append(image)
        
        }.resume()
    }
    
    func getarticleCount() -> Int{
        return articleList?.count ?? 0
    }
    func getArticle(_ atIndex: Int) -> ArticleData? {
        return articleList?[atIndex]
    }
}
