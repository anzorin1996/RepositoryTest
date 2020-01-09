//
//  XibStudentsTableViewCell.swift
//  studyHTCproject
//
//  Created by Андрей Зорин on 07/01/2020.
//  Copyright © 2020 Андрей Зорин. All rights reserved.
//

import UIKit

class XibStudentsTableViewCell: UITableViewCell {

    @IBOutlet weak var xibNameLabel: UILabel!
    
    @IBOutlet weak var xibMarkLabel: UILabel!
    
    func configure (_ data: DataStudent){
        xibNameLabel.text = data.Family + " " + data.Name
        xibMarkLabel.text = data.Mark
    }

    
}
