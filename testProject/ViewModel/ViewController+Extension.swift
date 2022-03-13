//
//  ViewController+Extension.swift
//  testProject
//
//  Created by Developer on 13.03.2022.
//

import Foundation
import UIKit
extension ViewController : LoadDataProtocol{
    func dataLoaded() {
        settingsDataLoaded()
        setupCells(dataSource: content.dataSourse.posts)
        reloadTableView()
    }
    func postLoaded(post: SinglePost) {}
    func errorDataLoad() {}
}
extension ViewController{
    func setupTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    func reloadTableView(){
        DispatchQueue.main.sync {
            tableView.reloadData()
        }
    }
    func settingsDataLoaded(){
        DispatchQueue.main.sync {
            activityIndicatorLoadDataSource.isHidden = true
            dataSourse = content.dataSourse.posts
        }
    }
    func setupCells(dataSource:[Post]){
        var arrCells : [PostTableViewCell] = []
        DispatchQueue.main.sync {
            for i in dataSource{
                if let cell = Bundle.main.loadNibNamed("PostTableViewCell", owner: self, options: nil)?.first as? PostTableViewCell {
                    cell.setData(post: i)
                    cell.delegate = self
                    arrCells.append(cell)
                }
            }
        }
        self.cells = arrCells
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let target = segue.destination as? PostViewController {
                target.id = postId
        }
    }
}
extension ViewController  : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = Bundle.main.loadNibNamed("PostTableViewCell", owner: self, options: nil)?.first as? PostTableViewCell else{
//            return UITableViewCell()
//        }
//        cell.setData(post: dataSourse[indexPath.row])
        return cells[indexPath.row]
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.postId = dataSourse[indexPath.row].postId
        guard let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "Post") as? PostViewController else{return}
        vc.navigationItem.title = cells[indexPath.row].title.text
        self.performSegue(withIdentifier: "toPost", sender: self)
    }
    
}
