//
//  Content.swift
//  testProject
//
//  Created by Developer on 13.03.2022.
//

import Foundation
class Content : NSObject{
    static var shared = Content()
    var postId : Int? = nil
    var network = Network.init()
    var dataSourse : DataSourse
    override init(){
        dataSourse = DataSourse.init(network: network)
        super.init()
    }
}
