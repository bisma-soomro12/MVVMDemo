//
//  DetailViewModel.swift
//  MVVMDemo
//
//  Created by Bisma Soomro-AIK on 1/27/23.
//

import Foundation
import Combine

class CommentsViewModel{
    
    var repository: ApiCallReposiory?
   @Published var commentList = [CommentModel]()
    
    init(repository: ApiCallReposiory) {
        self.repository = repository
    }
    
    func fetchCommentsApiData(url: String){
        repository?.fetchComments(url: url, completion: { result in
            switch result {
            case .success(let comments):
                self.commentList = comments
            case .failure(let err):
                print(err.localizedDescription)
            }
        })
    }
}
