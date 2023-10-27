//
//  ViewController.swift
//  NYC Schools
//
//  Created by Aset Bakirov on 05.10.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      let api: SchoolAPILogic = SchoolAPI()
      api.getSchools()
    }


}

