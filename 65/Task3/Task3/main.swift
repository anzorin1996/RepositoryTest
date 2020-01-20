//
//  main.swift
//  Task3
//
//  Created by Андрей Зорин on 20/01/2020.
//  Copyright © 2020 Андрей Зорин. All rights reserved.
//

import Foundation
import Alamofire

func createListUser (_ user:String) -> Void{
    request("https://api.github.com/users/\(user)/repos").responseJSON{ response in
        if let value = response.result.value, let arrayValue = value as? Array <Any>{
            if (arrayValue.isEmpty){
                print ("User doesn't have repositories")
                exit(0)
            }else{
                for repos in arrayValue {
                    if let reposDictionary = repos as? Dictionary <String,Any>, let NameReposDictionary = reposDictionary["name"] as? String {
                        print (NameReposDictionary)
                    }
                }
                exit(0)
            }
            
        } else {
            print ("NOT FAUND REPOSITORY")
            exit (0)
        }
    }
}
print("Enter Git-nickname please")
if let resp = readLine(){
    createListUser(resp)
    RunLoop.main.run()
}else{
    print("error")
    exit (0)
}
