//
//  PersonModel.swift
//  studyHTCproject
//
//  Created by Андрей Зорин on 07/01/2020.
//  Copyright © 2020 Андрей Зорин. All rights reserved.
//

import Foundation

class DataStudent: Codable {
    var Family: String
    var Name: String
    var Mark: String
    var id: String
    
    init (Family:String, Name:String, Mark:String){
        self.Family = Family
        self.Name = Name
        self.Mark = Mark
        self.id = UUID().uuidString
    }
}
var persons: [DataStudent] = DataStudent.load() {
    didSet {
        DataStudent.save(students: persons)
    }
}

//MARK -UserDefaults-
extension DataStudent{
    
    static let userDefaultsKey = "StudentsKey"
    
    static func save( students: [DataStudent]){
//        do {
            let data = try? JSONEncoder().encode(students)
//        } catch{
            //ALERT
//        }
        UserDefaults.standard.set(data, forKey: DataStudent.userDefaultsKey)
    }
    static func load() -> [DataStudent]{
        var returnValue: [DataStudent] = []
        if let data = UserDefaults.standard.data(forKey: DataStudent.userDefaultsKey),
            let students = try? JSONDecoder().decode([DataStudent].self, from: data){
            returnValue = students
        }
        return returnValue
    }
}
