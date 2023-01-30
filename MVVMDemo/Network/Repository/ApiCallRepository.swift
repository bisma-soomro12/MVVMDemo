//
//  ApiCallRepository.swift
//  MVVMDemo
//
//  Created by Bisma Soomro-AIK on 1/26/23.
//

import Foundation



class ApiCallReposiory{
    
    func fetchData(url: String, completion: @escaping (Result<[PostModel], ApiError>) -> Void){
        NetworkHandler.instance.request(url: url, completion: completion)
    }
    
    func fetchComments(url: String, completion: @escaping (Result<[CommentModel], ApiError>) -> Void){
        NetworkHandler.instance.request(url: url, completion: completion)
    }
    
    func fetchAlbums(url: String, completion: @escaping (Result<[AlbumsModel], ApiError>) -> Void){
        NetworkHandler.instance.request(url: url, completion: completion)
    }
    
}
