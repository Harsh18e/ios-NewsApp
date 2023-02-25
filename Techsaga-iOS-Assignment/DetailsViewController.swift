//
//  DetailsViewController.swift
//  Techsaga-iOS-Assignment
//
//  Created by Harsh Kumar Agrawal on 25/02/23.
//
import Foundation
import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    var articleData: ArticleData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headlineLabel.text = articleData?.title ?? ""
        dateLabel.text  = articleData?.publishedAt ?? ""
        descriptionLabel.text = articleData?.description ?? ""
        sourceLabel.text = articleData?.source.name ?? ""
    }
}
