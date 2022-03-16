//
//  ViewController+Extension.swift
//  testProject
//
//  Created by Developer on 13.03.2022.
//

import Foundation
import UIKit
extension ViewController:modifyEventCell{
    func hidePreview(sender: AnyObject) {
        if expandedCells.contains(sender.tag){
            guard let index = expandedCells.index(where: {$0 == sender.tag}) else{
                return
            }
            expandedCells.remove(at: Int(index))
        }
        tableView.reloadRows(at: [IndexPath.init(row: sender.tag, section: 0)], with: .fade)
    }
    func showPreview(sender:AnyObject) {
        if expandedCells.contains(sender.tag) {
            expandedCells = expandedCells.filter({ $0 != sender.tag})
        }
        else {
            expandedCells.append(sender.tag)
            tableView.reloadRows(at: [IndexPath.init(row: sender.tag, section: 0)], with: .fade)
        }
    }
}
extension ViewController : LoadDataProtocol{
    func dataLoaded() {
        settingsDataLoaded()
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let target = segue.destination as? PostViewController {
            target.id = postId
        }
    }
}
extension ViewController  : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = Bundle.main.loadNibNamed("PostTableViewCell", owner: self, options: nil)?.first as? PostTableViewCell else{
            return UITableViewCell()
        }
        cell.setData(post: dataSourse[indexPath.row])
        cell.delegate = self
        cell.showDetailOutlet.tag = indexPath.row
        cell.hideButtonOutlet.tag = indexPath.row
        if expandedCells.contains(indexPath.row) {
            cell.showDetailOutlet.isHidden = true
            cell.preview_text.numberOfLines = 100
            cell.hideButtonOutlet.isHidden = false
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.postId = dataSourse[indexPath.row].postId
        guard let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "Post") as? PostViewController else{return}
        vc.navigationItem.title = dataSourse[indexPath.row].title
        self.performSegue(withIdentifier: "toPost", sender: self)
    }
    
}
