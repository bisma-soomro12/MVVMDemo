//
//  DetailVC.swift
//  MVVMDemo
//
//  Created by Bisma Soomro-AIK on 1/26/23.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var detailLbl: UILabel!
    var viewModel : ViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLbl.text = viewModel?.selectedPost?.body
        
    }

}
