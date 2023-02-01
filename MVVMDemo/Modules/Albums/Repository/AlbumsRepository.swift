//
//  AlbumsRepository.swift
//  MVVMDemo
//
//  Created by Bisma Soomro-AIK on 1/31/23.
//

import Foundation
class AlbumsRepository{
    
    func fetchAlbums(url: String, completion: @escaping (Result<[AlbumsModel], ApiError>) -> Void){
        NetworkHandler.instance.request(url: url, completion: completion)
    }
    
}
