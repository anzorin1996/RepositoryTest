//
//  ViewController.swift
//  Task1
//
//  Created by Андрей Зорин on 18/01/2020.
//  Copyright © 2020 Андрей Зорин. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var taskTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTableView.dataSource = self
        taskTableView.delegate = self
        

        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCellID", for: indexPath)
        
        if let url = URL(string: "https://placehold.it/375x150?text=\(indexPath.row + 1)"){
            dowloadImage(withURL: url, forCell: cell)
        }
        return cell
    }
    func dowloadImage(withURL url:URL,forCell cell: UITableViewCell){
        var image:UIImage?
        if let data = try? Data(contentsOf: url){
            image = UIImage(data: data)
        }else{
            image = UIImage(named: "errorPicture")
        }
        let imageView = UIImageView(image: image)
        cell.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let leftConstraint = NSLayoutConstraint(item: imageView, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: cell, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1, constant: 10)
        let topConstraint = NSLayoutConstraint(item: imageView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: cell, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 10)
        let rightConstraint = NSLayoutConstraint(item: imageView, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: cell, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1, constant: 10)
        let botConstraint = NSLayoutConstraint(item: imageView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: cell, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 10)
        cell.addConstraints([leftConstraint,topConstraint,rightConstraint,botConstraint])
    }
    
}

