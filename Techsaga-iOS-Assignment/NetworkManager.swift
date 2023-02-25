//
//  NetworkManager.swift
//  Techsaga-iOS-Assignment
//
//  Created by Harsh Kumar Agrawal on 25/02/23.
//

import Foundation

class NetworkManager {
    public static let shared = NetworkManager()
    
    func apiCall(_ isSuccess: Bool = true, completion: @escaping (Result<NewsData, NetworkError>) -> Void) {
        
        let urlString = Constants.URL
        guard let url = URL(string: urlString) else { return }
        
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            guard error == nil, let data = data else {
                completion(.failure(NetworkError.apiError))
                return
            }
            do {
                let responseData = try JSONDecoder().decode(NewsData.self, from: data)
                completion(.success(responseData))
                
            } catch(_) {
                completion(.failure(.unableToParse))
            }
            
        }.resume()
    }
}
