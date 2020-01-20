//
//  ViewController.swift
//  Task4
//
//  Created by Андрей Зорин on 19/01/2020.
//  Copyright © 2020 Андрей Зорин. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    func isValidLogin(_ login: String) -> Bool {
        return (login.range(of: "^[a-zA-Z][a-zA-Z0-9.-]{2,31}$", options: .regularExpression, range: nil, locale: nil) != nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

