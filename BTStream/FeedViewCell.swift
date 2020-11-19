//
//  FeedViewCell.swift
//  BTStream
//
//  Created by 서혁규 on 2020/11/17.
//

import UIKit

class FeedViewCell: UITableViewCell {

    @IBOutlet weak var TextLabel: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    
    
    override func awakeFromNib(){
        super.awakeFromNib()
        
        // Initialization codey
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
