//
//  PostViewController.swift
//  testProject
//
//  Created by Developer on 13.03.2022.
//

import UIKit

class PostViewController: UIViewController {
    var id : Int? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        print(id)
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        print(id)
    }
}
