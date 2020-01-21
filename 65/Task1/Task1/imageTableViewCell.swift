//
//  imageTableViewCell.swift
//  Task1
//
//  Created by Андрей Зорин on 21/01/2020.
//  Copyright © 2020 Андрей Зорин. All rights reserved.
//

import UIKit

class imageTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func prepareForReuse() {
        photoImageView.image = nil
    }
    
    func configure (url: URL){
        indicator.startAnimating()
        DispatchQueue.global(qos: .userInitiated).async {
            [weak self] in
            var image:UIImage?
            if let data = try? Data (contentsOf: url){
                image = UIImage (data: data)
            } else {
                image = UIImage(named: "errorPicture")
            }
            DispatchQueue.main.async {
                self?.photoImageView.image = image
                self?.indicator.stopAnimating()
            }
        }
        
    }
    

    
}
