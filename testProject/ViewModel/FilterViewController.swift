//
//  FilterViewController.swift
//  testProject
//
//  Created by Developer on 14.03.2022.
//

import UIKit

class FilterViewController: UIViewController {

    @IBAction func filterByDatePressed(_ sender: Any) {
        self.prepare(for: UIStoryboardSegue.init(identifier: "toFilter", source: self, destination: ViewController()), sender: self)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func filterByRatingPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "toFilter", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let target = segue.destination as? ViewController {
            target.test = "12345678"
        }
    }
}
