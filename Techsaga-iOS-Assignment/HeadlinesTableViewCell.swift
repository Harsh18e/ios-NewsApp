//
//  HeadlinesTableViewCell.swift
//  Techsaga-iOS-Assignment
//
//  Created by Harsh Kumar Agrawal on 25/02/23.
//

import UIKit
import UIKit

class HeadlinesTableViewCell: UITableViewCell {

    @IBOutlet private weak var headlineLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var sourceLabel: UILabel!
    
    @IBOutlet weak var containerView: CustomUIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(_ article: ArticleData?) {
        guard let article = article else {return}
        
        headlineLabel.text = article.title
        dateLabel.text = article.publishedAt
        sourceLabel.text = article.source.name
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
