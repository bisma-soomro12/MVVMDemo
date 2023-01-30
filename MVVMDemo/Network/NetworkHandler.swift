//
//  NetworkHandler.swift
//  MVVMDemo
//
//  Created by Bisma Soomro-AIK on 1/27/23.
//

import Foundation

enum ApiError: Error{
    case internalError
    case serverError
    case parsingError
    
}

class NetworkHandler{
    
    static let instance = NetworkHandler()
    
    func request<T: Codable>(url: String, completion: @escaping ((Result<T, ApiError>) -> Void)){
        guard let url = URL(string: url) else {
            completion(.failure(.internalError))
            return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(.serverError))
                return }
            do{
                let object = try JSONDecoder().decode(T.self, from: data)
                completion(Result.success(object))
                    
            } catch{
                completion(.failure(.parsingError))
            }
        }
        task.resume()
        
    }
}
