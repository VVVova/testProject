//
//  PostViewController.swift
//  testProject
//
//  Created by Developer on 13.03.2022.
//

import UIKit

class PostViewController: UIViewController {
    var id : Int? = nil
    @IBOutlet weak var titlePost: UILabel!
    var content = Content.init()
    @IBOutlet weak var textView: UITextView!
    var images : [UIImage] = []
    @IBOutlet weak var stackView: UIStackView!
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

