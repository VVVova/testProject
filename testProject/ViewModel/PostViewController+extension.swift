//
//  PostViewController+extension.swift
//  testProject
//
//  Created by Developer on 14.03.2022.
//

import Foundation
import UIKit
extension PostViewController : LoadDataProtocol{
    func dataLoaded() {
    }
    func postLoaded(post: SinglePost) {
        self.post = post
        DispatchQueue.main.async {
            self.navigationItem.title = post.title ?? ""
        }
        if let postContent = self.post{
            DispatchQueue.main.sync {
                self.titlePost.text = postContent.title ?? ""
                self.textView.text = postContent.text ?? ""
            }
            getImages(post: postContent)
        }
    }
    func getImages(post:SinglePost){
        if let imageUrls = post.images{
            if !imageUrls.isEmpty{
                var dataImages : [Data?] = []
                for i in imageUrls{
                    if let image = content.network.dowloadImage(url: i){
                        dataImages.append(image)
                    }
                }
                var imagesViewArray : [UIImage] = []
                for data in dataImages{
                    if let dataimage = data{
                        if let image = UIImage.init(data: dataimage){
                            imagesViewArray.append(image)
                            DispatchQueue.main.sync {
                                indicator.isHidden = true
                                stackView.addArrangedSubview(UIImageView.init(image: image))
                            }
                        }
                    }
                }

                self.images = imagesViewArray
            }
        }
    }
    func errorDataLoad() {
        DispatchQueue.main.sync {
            indicator.isHidden = true
            titlePost.text = "Ошибка загрузки поста"
        }
    }
}
