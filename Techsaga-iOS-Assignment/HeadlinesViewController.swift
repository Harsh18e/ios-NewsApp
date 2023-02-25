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
        tableView.register(HeadlinesTableViewCell.self, forCellReuseIdentifier: "HeadlinesCell")
    }
}

extension HeadlinesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getarticleCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeadlinesCell" , for: indexPath) as! HeadlinesTableViewCell
        
        let article = self.viewModel.getArticle(indexPath.row)
        
        cell.setupCell(article)
        return cell
    }
}
