//
//  DataModel.swift
//  testProject
//
//  Created by Developer on 13.03.2022.
//

import Foundation

struct Response : Codable{
    var posts : [Post]?
}
struct Post : Codable{
    var postId : Int?
    var timeshamp : Int?
    var title : String?
    var preview_text : String?
    var likes_count : Int?
}

struct ResponseSinglePost :Codable{
    var post : SinglePost?
}
struct SinglePost:Codable{
    var postId : Int?
    var timeshamp : Int?
    var title : String?
    var text : String?
    var images : [String]?
    var likes_count : Int?
}

