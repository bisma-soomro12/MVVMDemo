//
//  PostRepository.swift
//  MVVMDemo
//
//  Created by Bisma Soomro-AIK on 1/31/23.
//

import Foundation
class PostRepository{
    
    func fetchData(url: String, completion: @escaping (Result<[PostModel], ApiError>) -> Void){
        NetworkHandler.instance.request(url: url, completion: completion)
    }
    
}
