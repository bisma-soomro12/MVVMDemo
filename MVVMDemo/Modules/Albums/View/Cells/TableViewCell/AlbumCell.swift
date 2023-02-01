//
//  AlbumCell.swift
//  MVVMDemo
//
//  Created by Bisma Soomro-AIK on 1/30/23.
//

import UIKit
import SDWebImage

class AlbumCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var albums : AlbumsModel?{
        didSet{
            titleLbl.text = albums?.title
            imgView.layer.cornerRadius = 10
            imgView.sd_setImage(with: URL(string: albums!.url), placeholderImage: UIImage(systemName: ""))
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
