//
//  ViewController.swift
//  testProject
//
//  Created by Developer on 13.03.2022.
//

import UIKit

class ViewController: UIViewController,modifyEventCell{
    func modify() {
        
    }
    var postId : Int? = nil
    var content = Content.init()
    var dataSourse : [Post] = []
    var cells : [PostTableViewCell] = []
    @IBOutlet weak var activityIndicatorLoadDataSource: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        content.dataSourse.loadDataDelegate = self
    }
}

