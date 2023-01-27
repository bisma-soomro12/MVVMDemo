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
        self.fetchDataFromRepository()
    }
    
    
    func fetchDataFromRepository(){
        apiRepository?.fetch(completionHandler: { posts in
            self.postList = posts
        })
    }
}
