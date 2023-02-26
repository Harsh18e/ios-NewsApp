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
    
    @IBOutlet weak var backButtonView: CustomUIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(dismissVC))
        backButtonView.addGestureRecognizer(gesture)
        
        headlineLabel.text = articleData?.title ?? "wrer"
        let dateText = String((articleData?.publishedAt ?? "T").split(separator: "T")[0])
        dateLabel.text  = dateText + " "
        descriptionLabel.text = articleData?.description ?? "wwerw"
        sourceLabel.text = articleData?.author ?? "cccc"
    }
    
    @objc private func dismissVC(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
