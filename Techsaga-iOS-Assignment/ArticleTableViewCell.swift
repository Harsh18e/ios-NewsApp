//
//  ArticleTableViewCell.swift
//  Techsaga-iOS-Assignment
//
//  Created by Harsh Kumar Agrawal on 25/02/23.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var bgImageView: UIImageView!
    
    var cellIndex: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(_ article: ArticleData?, _ image: UIImage) {
        guard let article = article else { return }
        
        let dateText = String((article.publishedAt ?? "T").split(separator: "T")[0])
        
        headlineLabel.text = dateText + " "
        dateLabel.text = article.title
        sourceLabel.text = article.author ?? "sdgfv"
        
        bgImageView.image = image
        bgImageView.contentMode = .scaleAspectFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
