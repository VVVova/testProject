//
//  ViewController.swift
//  testProject
//
//  Created by Developer on 13.03.2022.
//

import UIKit

class ViewController: UIViewController{
    var expandedCells = [Int]()
    var test : String = ""
    var postId : Int? = nil
    var content = Content.init()
    var dataSourse : [Post] = []
    @IBOutlet weak var activityIndicatorLoadDataSource: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var filterButton: UIBarButtonItem!
    @IBAction func filterButtonPressed(_ sender: Any) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(test)
        // Do any additional setup after loading the view.
        content.dataSourse.loadDataDelegate = self
    }
}

