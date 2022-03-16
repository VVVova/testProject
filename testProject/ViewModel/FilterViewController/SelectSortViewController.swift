//
//  FilterViewController.swift
//  testProject
//
//  Created by Developer on 14.03.2022.
//

import UIKit
enum sortMethod{
    case byDate
    case byRating
}
class SelectSortViewController: UIViewController {
    public var completion : ((sortMethod) -> Void)?
    @IBAction func filterByDatePressed(_ sender: Any) {
        completion?(sortMethod.byDate)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func filterByRatingPressed(_ sender: Any) {
        completion?(sortMethod.byRating)
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
