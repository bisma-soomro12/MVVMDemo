//
//  ViewModel.swift
//  MVVMDemo
//
//  Created by Bisma Soomro-AIK on 1/26/23.
//

import Foundation
import Combine

class ViewModel{

    @Published  var postList = [PostModel]()
    var apiRepository : ApiCallReposiory?
    var selectedPost : PostModel?
    
    init(apiRepository: ApiCallReposiory) {
        self.apiRepository = apiRepository
       // self.fetchDataFromRepository()
    }
    
    
    func fetchDataFromRepository(url: String){

        apiRepository?.fetchData(url: url, completion: { result in
            switch result{
            case .success(let posts):
                self.postList = posts
            case .failure(let err):
                print(err.localizedDescription)
            }
        })
    }
}
