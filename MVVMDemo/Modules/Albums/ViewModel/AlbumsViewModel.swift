//
//  AlbumsViewModel.swift
//  MVVMDemo
//
//  Created by Bisma Soomro-AIK on 1/30/23.
//

import Foundation
import Combine

class AlbumsViewModel {
    
    var repository: ApiCallReposiory?
    @Published var albumList = [AlbumsModel]()
    
    init(repository: ApiCallReposiory) {
        self.repository = repository
    }
    
    func fetchAlbumFromRepo(url: String){
        repository?.fetchAlbums(url: url , completion: { result in
            switch result {
            case .success(let albums):
                self.albumList = albums
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
}
