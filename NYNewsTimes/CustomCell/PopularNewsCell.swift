//
//  PopularNewsCell.swift
//  NYNewsTimes
//
//  Created by Jeeva on 18/12/20.
//

import UIKit
import Kingfisher

class PopularNewsCell: UITableViewCell {
    
    @IBOutlet weak var imageThump: UIImageView!
    
    @IBOutlet weak var labelSubTitle: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDate: UILabel!

    static var cellIdentifier = "PopularNewsCell"
    static var cellXib = "PopularNewsCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageThump.layer.cornerRadius = imageThump.bounds.height/2.0 
        imageThump.layer.masksToBounds = true
        
        labelTitle.textColor = UIColor.label
        labelSubTitle.textColor = UIColor.ProjectColors.lightGray
        labelDate.textColor = UIColor.ProjectColors.lightGray

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindDataOnCell(news : Result) {
        self.selectionStyle = .none
        self.labelTitle.text = news.title
        if let writer = news.byline {
            labelSubTitle.text = writer.capitalized
        }

        if let date = news.publishedDate {
            labelDate.text = "🗓 " + date
        }

        guard let imageURLString = news.media?.first?.mediaMetadata?.first?.url, let imageURL = URL(string: imageURLString) else {
            return
        }
        imageThump.kf.indicatorType = .activity
        imageThump.kf.setImage(with: imageURL, options: [.transition(.fade(0.2))])
    }
    
}
