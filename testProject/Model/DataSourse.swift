//
//  DataSourse.swift
//  testProject
//
//  Created by Developer on 13.03.2022.
//

import Foundation
protocol LoadDataProtocol{
    func dataLoaded()
    func postLoaded(post:SinglePost)
    func errorDataLoad()
}
class DataSourse{
    var network : Network
    var loadDataDelegate : LoadDataProtocol?
    var posts : [Post] = []
    init(network:Network){
        self.network = network
        self.network.delegate = self
        DispatchQueue.main.async {
            if let postsUrl =  postsURL{
                network.getPosts(url: postsUrl)
            }
        }
    /* or
         if let postsUrl =  postsURL{
             network.getPost(url: postsUrl, completion: { [self] data in
                 self.posts = data
             })
         }
    */
    }
}
extension DataSourse : NetworkProtocol{
    func failedRequest() {
        loadDataDelegate?.errorDataLoad()
    }
    
    func getPostsComplete(posts: [Post]) {
        self.posts = posts
        loadDataDelegate?.dataLoaded()
    }
    
    func getPostComplete(post: SinglePost) {
        loadDataDelegate?.postLoaded(post: post)
    }
}
