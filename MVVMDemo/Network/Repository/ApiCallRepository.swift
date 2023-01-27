//
//  ApiCallRepository.swift
//  MVVMDemo
//
//  Created by Bisma Soomro-AIK on 1/26/23.
//

import Foundation
class ApiCallReposiory{
    
    
    func fetch(completionHandler: @escaping ([PostModel]) -> () ){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            do{
                let posts = try JSONDecoder().decode([PostModel].self, from: data)
                DispatchQueue.main.async {
                    //self?.posts = posts
                    completionHandler(posts)
                }
            } catch{
                print(error)
            }
        }
        task.resume()
    }
}
