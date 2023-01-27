//
//  ViewController.swift
//  MVVMDemo
//
//  Created by Bisma Soomro-AIK on 1/26/23.
//

import UIKit
import Combine

class MainVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewModel : ViewModel?
    var cancelables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ViewModel(apiRepository: ApiCallReposiory())
        tableView.register(UINib(nibName: "PostCell", bundle: nil), forCellReuseIdentifier: "PostCellId")
        tableView.delegate = self
        tableView.dataSource = self
        
        setObserver()
    }


    func setObserver(){
        viewModel?.$postList.sink(receiveValue: { posts in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }).store(in: &cancelables)
    }
}

extension MainVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.postList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PostCellId", for: indexPath) as? PostCell{
            cell.postData = viewModel?.postList[indexPath.row]
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC{
            viewModel?.selectedPost = viewModel?.postList[indexPath.row]
            vc.viewModel = viewModel
            present(vc, animated: true)
        }
    }
}

