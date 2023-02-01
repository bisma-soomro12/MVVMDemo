//
//  DetailCell.swift
//  MVVMDemo
//
//  Created by Bisma Soomro-AIK on 1/27/23.
//

import UIKit

class CommentCell: UITableViewCell {

    @IBOutlet weak var bodyLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    
    var commentData: CommentModel?{
        didSet{
            titleLbl.text = commentData?.name
            bodyLbl.text = commentData?.body
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
