//
//  CommentsRepository.swift
//  MVVMDemo
//
//  Created by Bisma Soomro-AIK on 1/31/23.
//

import Foundation
class CommentRepository{
    
    func fetchComments(url: String, completion: @escaping (Result<[CommentModel], ApiError>) -> Void){
        NetworkHandler.instance.request(url: url, completion: completion)
    }
}
