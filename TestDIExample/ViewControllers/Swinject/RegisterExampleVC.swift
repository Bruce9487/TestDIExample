//
//  RegisterExampleVC.swift
//  TestDIExample
//
//  Created by Bruce Chen on 2022/9/11.
//

import UIKit
import Swinject

class RegisterExampleVC: UIViewController {

    //註冊
    let container: Container = {
        let container = Container()
        container.register(Animal.self) { _ in Dog(name: "Jack") }
        container.register(Person.self) { resolver in
            PetOwner(name: "Jeff", pet: resolver.resolve(Animal.self)!)
        }
        return container
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //透過resolver方法來取得服務實例
        let animal = container.resolve(Animal.self)!
        let person = container.resolve(Person.self)!
        
        print("[RegisterExampleVC] Animal Name:", animal.name)
        print("[RegisterExampleVC] person Name:", person.name)
        
        let petOwner = person as! PetOwner
        let pet = petOwner.pet
        
        print("[RegisterExampleVC] petOwner Name:", petOwner.name)
        print("[RegisterExampleVC] pet Name:", pet.name)
    }
}
