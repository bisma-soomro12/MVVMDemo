//
//  AlbumVC.swift
//  MVVMDemo
//
//  Created by Bisma Soomro-AIK on 1/30/23.
//

import UIKit
import Combine

class AlbumView: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var viewModel : AlbumsViewModel?
    var cancelables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = AlbumsViewModel(repository: AlbumsRepository())
        
        tableView.register(UINib(nibName: "AlbumCell", bundle: nil), forCellReuseIdentifier: "AlbumCellId")
        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel?.fetchAlbumFromRepo(url: "https://jsonplaceholder.typicode.com/photos")
        setObserver()
        
    }
    
    func setObserver(){
        viewModel?.$albumList.sink(receiveValue: { albums in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }).store(in: &cancelables)
    }
}

extension AlbumView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.albumList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCellId", for: indexPath) as? AlbumCell{
            cell.albums = viewModel?.albumList[indexPath.row]
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
