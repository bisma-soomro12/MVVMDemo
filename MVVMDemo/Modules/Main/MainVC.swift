//
//  ViewController.swift
//  MVVMDemo
//
//  Created by Bisma Soomro-AIK on 1/26/23.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var albumBtn: UIButton!
    @IBOutlet weak var commentBtn: UIButton!
    @IBOutlet weak var postBtn: UIButton!
    override func viewDidLoad() {
        postBtn.layer.cornerRadius = 10
        commentBtn.layer.cornerRadius = 10
        albumBtn.layer.cornerRadius = 10
    }

    @IBAction func postsBtnDidTap(_ sender: Any) {
       let storyBoard = UIStoryboard(name: "Posts", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: "PostVC" ) as? PostVC{
            present(vc, animated: true)
        }
        
    }
    @IBAction func commentsBtnDidTap(_ sender: Any) {
        
        let storyBoard = UIStoryboard(name: "Comments", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: "CommentsVC") as? CommentsVC{
            present(vc, animated: true)
        }
        
    }
    @IBAction func albumsBtnDidTap(_ sender: Any) {
        
        let storyBoard = UIStoryboard(name: "Albums", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: "AlbumVC") as? AlbumVC {
            present(vc, animated: true)
        }
    }
    

}



