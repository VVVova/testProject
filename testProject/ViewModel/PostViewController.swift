//
//  PostViewController.swift
//  testProject
//
//  Created by Developer on 13.03.2022.
//

import UIKit

class PostViewController: UIViewController {
    var id : Int? = nil
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titlePost: UILabel!
    var content = Content.init()
    @IBOutlet weak var textView: UITextView!
    var images : [UIImage] = []
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    var post : SinglePost? = nil
    override func viewDidLoad() {
        content.dataSourse.loadDataDelegate = self
        super.viewDidLoad()
        if let id = id {
            content.dataSourse.network.getPost(url: getPostUrl(by: id))
        }
    }
    override func viewDidAppear(_ animated: Bool) {
    }
}
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
            
            DispatchQueue.main.sync {
                tableView.reloadData()
                indicator.isHidden = true
            }
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
            }
        }
    }
    func errorDataLoad() {
    }
}
//нужно было scrollview юзать
extension PostViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = Bundle.main.loadNibNamed("ImageTableViewCell", owner: self, options: nil)?.first as? ImageTableViewCell else{
            return UITableViewCell()
        }
        cell.imagePost.image = images[indexPath.row]
        return  cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
