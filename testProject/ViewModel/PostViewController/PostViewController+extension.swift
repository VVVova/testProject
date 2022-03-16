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
                self.dataSource.append(postTitleCell(text: postContent.title ?? ""))
                if let postTextCell = postTextTableViewCell(post: postContent){
                    self.dataSource.append(postTextCell)
                    tableView.reloadData()
                }
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
                        }
                    }
                }
                self.images = imagesViewArray
                if !images.isEmpty{
                    DispatchQueue.main.sync {
                        dataSource.append(contentsOf: imagesTableViewCell(images: images))
                        tableView.reloadData()
                    }
                }
            }
        }
    }
    func errorDataLoad() {
        DispatchQueue.main.sync {
            self.dataSource.append(postTitleCell(text: "Ошибка загрузки поста"))
            tableView.reloadData()
        }
    }
    func postTextTableViewCell(post:SinglePost)->DetailPostTableViewCell?{
        guard let cell = Bundle.main.loadNibNamed("DetailPostTableViewCell", owner: self, options: nil)?.first as? DetailPostTableViewCell else{
            return nil
        }
        cell.textPost.text = post.text ?? ""
        return cell
    }
    func imagesTableViewCell(images:[UIImage])->[ImagePostTableViewCell]{
        var arrayCells : [ImagePostTableViewCell] = []
        for image in images{
            if let cell = imageTableViewCell(image: image){
                arrayCells.append(cell)
            }
        }
        return arrayCells
    }
    func imageTableViewCell(image:UIImage)->ImagePostTableViewCell?{
        guard let cell = Bundle.main.loadNibNamed("ImagePostTableViewCell", owner: self, options: nil)?.first as? ImagePostTableViewCell else{
            return nil
        }
        cell.imagePost.image = image
        return cell
    }
    func postTitleCell(text:String)->TitleTableViewCell?{
        guard let cell = Bundle.main.loadNibNamed("TitleTableViewCell", owner: self, options: nil)?.first as? TitleTableViewCell else{
            return nil
        }
        cell.postTitle.text = text
        return cell
    }
}
extension PostViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return dataSource[indexPath.row] as? UITableViewCell ?? UITableViewCell()
    }
    
    
}
