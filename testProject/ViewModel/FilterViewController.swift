//
//  FilterViewController.swift
//  testProject
//
//  Created by Developer on 14.03.2022.
//

import UIKit
enum filterMethod :String{
    case byDate = "FilterByDate"
    case byRating = "FilterByRating"
}
class FilterViewController: UIViewController {
    public var completion : ((filterMethod) -> Void)?
    @IBAction func filterByDatePressed(_ sender: Any) {
        completion?(filterMethod.byDate)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func filterByRatingPressed(_ sender: Any) {
        completion?(filterMethod.byRating)
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
