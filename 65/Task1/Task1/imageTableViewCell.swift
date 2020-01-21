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
}
