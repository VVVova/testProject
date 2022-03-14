//
//  Network.swift
//  testProject
//
//  Created by Developer on 13.03.2022.
//

import Foundation
protocol NetworkProtocol{
    func getPostsComplete(posts:[Post])
    func getPostComplete(post:SinglePost)
    func failedRequest()
}
class Network{
    var delegate : NetworkProtocol?
    // use completion
    func getPost(url:URL?,completion: @escaping ([Post]) ->()){
        if let url = url{
            URLSession.shared.dataTask(with: url) { [self] data, response, error in
                guard let data = data,error == nil else {
                    print("Error")
                    return
                }
                var response : Response?
                do{
                    response = try JSONDecoder().decode(Response.self, from: data)
                }catch{
                    print("error parse response with error \(error.localizedDescription)")
                }
                guard let json = response else{
                    return
                }
                completion(json.posts ?? [])
            }.resume()
        }
    }
    func getPost(url:URL?,completion: @escaping (SinglePost?) ->()){
        if let url = url{
            URLSession.shared.dataTask(with: url) { [self] data, response, error in
                guard let data = data,error == nil else {
                    print("Error get post")
                    return
                }
                var response : ResponseSinglePost?
                do{
                    response = try JSONDecoder().decode(ResponseSinglePost.self, from: data)
                }catch{
                    
                    print("error parse response with error \(error.localizedDescription)")
                }
                guard let json = response else{
                    return
                }
                completion(json.post ?? nil)
            }.resume()
        }
    }
    // or use delegates
    func getPosts(url:URL?){
        if let url = url{
            URLSession.shared.dataTask(with: url) { [self] data, response, error in
                guard let data = data,error == nil else {
                    print("Error")
                    return
                }
                var response : Response?
                do{
                    response = try JSONDecoder().decode(Response.self, from: data)
                }catch{
                    delegate?.failedRequest()
                    print("error parse response with error \(error.localizedDescription)")
                }
                guard let json = response else{
                    return
                }
                delegate?.getPostsComplete(posts: json.posts ?? [])
            }.resume()
        }
    }
    func getPost(url:URL?){
        if let url = url{
            URLSession.shared.dataTask(with: url) { [self] data, response, error in
                guard let data = data,error == nil else {
                    print("Error get post")
                    return
                }
                var response : ResponseSinglePost?
                do{
                    response = try JSONDecoder().decode(ResponseSinglePost.self, from: data)
                }catch{
                    delegate?.failedRequest()
                    print("error parse response with error \(error.localizedDescription) url:\(url)")
                }
                guard let json = response else{
                    return
                }
                if let singlePost = json.post{
                    delegate?.getPostComplete(post: singlePost)
                }
            }.resume()
        }
    }
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    func dowloadImage(url:String)->Data?{
        guard let url = URL.init(string: url)else{return nil}
        do {
            let conUrl = try? Data(contentsOf: url)
            if let imageData = conUrl{
                return imageData
            }else{return nil}
        }catch{
            print(error.localizedDescription)
            return nil
        }
    }
}
