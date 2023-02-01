//
//  DetailVC.swift
//  MVVMDemo
//
//  Created by Bisma Soomro-AIK on 1/26/23.
//

import UIKit
import Combine

class CommentsView: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel : CommentsViewModel?
    var cancelables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CommentsViewModel(repository: CommentRepository())
        
        tableView.register(UINib(nibName: "CommentCell", bundle: nil), forCellReuseIdentifier: "CommentCellId")
        tableView.dataSource = self
        
        viewModel?.fetchCommentsApiData(url: "https://jsonplaceholder.typicode.com/comments")
        setObserver()
    }
    
    func setObserver(){
        viewModel?.$commentList.sink(receiveValue: { posts in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }).store(in: &cancelables)
    }

}

extension CommentsView : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.commentList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCellId", for: indexPath) as? CommentCell{
            cell.commentData = viewModel?.commentList[indexPath.row]
            return cell
        }
        
        return UITableViewCell()
    }
}
