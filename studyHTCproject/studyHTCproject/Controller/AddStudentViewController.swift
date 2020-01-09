//
//  AddStudentViewController.swift
//  studyHTCproject
//
//  Created by Андрей Зорин on 09/01/2020.
//  Copyright © 2020 Андрей Зорин. All rights reserved.
//

import UIKit

class AddStudentViewController: UIViewController {
    
    var studentProperty: DataStudent?

    @IBOutlet weak var familyTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var markTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let studentProperty = self.studentProperty {
            familyTextField.text = studentProperty.Family
            nameTextField.text = studentProperty.Name
            markTextField.text = studentProperty.Mark
        }
        
    }
    
    @IBAction func addStudentAction(_ sender: UIButton) {
        
        let student = DataStudent(Family: familyTextField.text ?? "", Name: nameTextField.text ?? "", Mark: markTextField.text ?? "")
        let mark = student.Mark.filter {Constants.numbers.contains($0)}
        let family = student.Family.filter {Constants.letters.contains($0)}
        let name = student.Name.filter {Constants.letters.contains($0)}
        if student.Family == ""{
            showAlert ("Не заполнено поле 'Фамилия'", "Ошибка")
        }else if student.Name == "" {
            showAlert ("Не заполнено поле 'Имя'", "Ошибка")
        }else if student.Mark == "" {
            showAlert ("Не заполнено поле 'Средний балл'", "Ошибка")
        }else if  (student.Mark.count != 1) || (mark != student.Mark){
            showAlert ("В поле 'Средний балл' должно содержаться только целое число от 1 до 5", "Ошибка")
        }else if family != student.Family{
            showAlert ("В поле 'Фамилия' должны содержаться только русские или английские символы без пробелов", "Ошибка")
        }else if name != student.Name{
            showAlert ("В поле 'Имя' должны содержаться только русские или английские символы без пробелов", "Ошибка")
        }
        else{
            if self.studentProperty != nil {
                for item in 0...(persons.count - 1) {
                    if persons[item].id == studentProperty!.id{
                        persons[item].Family = student.Family
                        persons[item].Name = student.Name
                        persons[item].Mark = student.Mark
                        DataStudent.save(students: persons)
                        showAlert (" ", "Изменение сохранено!")
                    }
                }
            }else{
                persons.append(student)
                showAlert (" ", "Новая запись сохранена!")
            }
            familyTextField.text = ""
            nameTextField.text = ""
            markTextField.text = ""
        }
    }
    private func showAlert (_ message: String, _ title: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        present(alert, animated: true, completion: nil)
        alert.addAction(okAction)
    }
}
