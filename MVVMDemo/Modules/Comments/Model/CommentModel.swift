//
//  CommentModel.swift
//  MVVMDemo
//
//  Created by Bisma Soomro-AIK on 1/27/23.
//

import Foundation
struct CommentModel: Codable{
    let postId : Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
