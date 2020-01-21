//
//  ViewController.swift
//  Task1
//
//  Created by Андрей Зорин on 18/01/2020.
//  Copyright © 2020 Андрей Зорин. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var taskTableView: UITableView!{
        didSet{
            taskTableView.dataSource = self
            taskTableView.delegate = self
            let nib = UINib(nibName: "imageTableViewCell", bundle: nil)
            taskTableView.register(nib, forCellReuseIdentifier: "taskCellID")
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCellID", for: indexPath) as! imageTableViewCell
        
        if let url = URL(string: "https://placehold.it/375x150?text=\(indexPath.row + 1)"){
            dowloadImage(withURL: url, forCell: cell)
        }
        return cell
    }
    func dowloadImage(withURL url:URL,forCell cell: imageTableViewCell){
        cell.indicator.startAnimating()
        DispatchQueue.global(qos: .userInitiated).async {
            var image:UIImage?
            if let data = try? Data (contentsOf: url){
                image = UIImage (data: data)
            } else {
                image = UIImage(named: "errorPicture")
            }
            DispatchQueue.main.async {
                cell.photoImageView.image = image
                cell.indicator.stopAnimating()
            }
        }
    }
    
}

