//
//  HeadlinesViewController.swift
//  Techsaga-iOS-Assignment
//
//  Created by Harsh Kumar Agrawal on 25/02/23.
//


import Foundation
import UIKit

class HeadlinesViewController: UIViewController, ViewModelDelegate {
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        viewModel.makeNetworkCall()
        tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension HeadlinesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getarticleCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath) as! ArticleTableViewCell
        
        let article = self.viewModel.getArticle(indexPath.row)
        
        cell.setupCell(article)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = DetailsViewController(nibName: "DetailsViewController", bundle: nil)
        vc.articleData = self.viewModel.getArticle(indexPath.row)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
