//
//  ViewController.swift
//  studyHTCproject
//
//  Created by Андрей Зорин on 07/01/2020.
//  Copyright © 2020 Андрей Зорин. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var studentsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        studentsTableView.dataSource = self
        studentsTableView.delegate = self
        let nib = UINib(nibName: Constants.nibNameStudents, bundle: nil)
        studentsTableView.register(nib, forCellReuseIdentifier: Constants.xibStudentsID)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        persons = DataStudent.load()
        studentsTableView.tableFooterView = UIView()
        studentsTableView.reloadData()
    }
    

    @IBAction func didTapMoveToVC(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: Constants.mainStoryboard, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: Constants.addStudentVCID)
        navigationController?.pushViewController(vc, animated: true)
    }
}
//MARK: -Table Config-
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.xibStudentsID, for: indexPath) as! XibStudentsTableViewCell
        cell.configure(persons[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            persons.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: Constants.mainStoryboard, bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: Constants.addStudentVCID) as? AddStudentViewController{
            vc.studentProperty = persons[indexPath.row]
            navigationController?.show(vc, sender: nil)
        }
    }
    
}
