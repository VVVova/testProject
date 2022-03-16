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
    @IBOutlet weak var tableView: UITableView!
    var content = Content.init()
    var images : [UIImage] = []
    var dataSource = [Any]()
    var post : SinglePost? = nil
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        content.dataSourse.loadDataDelegate = self
        super.viewDidLoad()
        if let id = id {
            content.dataSourse.network.getPost(url: getPostUrl(by: id))
        }
    }
    override func viewDidAppear(_ animated: Bool) {
    }
}

