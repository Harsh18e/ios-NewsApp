//
//  HeadlinesViewController.swift
//  Techsaga-iOS-Assignment
//
//  Created by Harsh Kumar Agrawal on 25/02/23.
//


import Foundation
import UIKit
import GoogleSignIn

class HeadlinesViewController: UIViewController, ViewModelDelegate {
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    @IBAction func signOutButton(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: Constants.LOGINSTATUS)
        
        GIDSignIn.sharedInstance.signOut()
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: String(describing: LoginViewController.self)) as! LoginViewController
        
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @IBOutlet weak var tableView: UITableView!
    private var viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        viewModel.makeNetworkCall()
        tableView.register(UINib(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "articleCell")
    }
}

extension HeadlinesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getarticleCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell" , for: indexPath) as! ArticleTableViewCell
        
        let article = self.viewModel.getArticle(indexPath.row)
        cell.cellIndex = indexPath.row
        cell.setupCell(article, self.viewModel.bgImages[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: String(describing: DetailsViewController.self)) as! DetailsViewController

        vc.articleData = self.viewModel.getArticle(indexPath.row)
        
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}
