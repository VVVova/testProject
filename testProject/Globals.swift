//
//  Globals.swift
//  testProject
//
//  Created by Developer on 13.03.2022.
//

import Foundation
var urlApi = "https://raw.githubusercontent.com/aShaforostov/jsons/master/api/main.json"
var postsURL : URL?{
    get{
        return URL.init(string: urlApi)
    }
}
func getPostUrl(by id : Int)->URL?{
    //https://raw.githubusercontent.com/ aShaforostov/jsons/master/api/posts/[id].json
    let stringUrl =  "https://raw.githubusercontent.com/aShaforostov/jsons/master/api/posts/\(id).json"
    return URL.init(string: stringUrl)
}
