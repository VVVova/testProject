//
//  ViewController.swift
//  testProject
//
//  Created by Developer on 13.03.2022.
//

import UIKit

class ViewController: UIViewController{    
    var expandedCells = [Int]()
    var postId : Int? = nil
    var content = Content.init()
    var dataSourse : [Post] = []
    @IBOutlet weak var activityIndicatorLoadDataSource: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var filterButton: UIBarButtonItem!
    @IBAction func filterButtonPressed(_ sender: Any) {
        guard let vc  = storyboard?.instantiateViewController(withIdentifier: "FilterVC") as? FilterViewController else{return}
        vc.modalPresentationStyle = .popover
        vc.completion = { [self] filterMethod in
            switch filterMethod{
            case .byDate:
                filterByDate()
            case .byRating:
                filterByRating()
            }
        }
        self.present(vc, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        content.dataSourse.loadDataDelegate = self
    }
    func filterByDate(){
        let dataSourceSorted = dataSourse.sorted { (first, second) -> Bool in
            return (first.timeshamp ?? 0) > (second.timeshamp ?? 0)
        }
        dataSourse = dataSourceSorted
        tableView.reloadData()
    }
    func filterByRating(){
        let dataSourceSorted = dataSourse.sorted { (first, second) -> Bool in
            return (first.likes_count ?? 0) > (second.likes_count ?? 0)
        }
        dataSourse = dataSourceSorted
        tableView.reloadData()
    }
}

