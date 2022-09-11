//
//  MutiSameServiceVC.swift
//  TestDIExample
//
//  Created by Bruce Chen on 2022/9/11.
//

import UIKit
import Swinject

class MutiSameServiceVC: UIViewController {

    //註冊
    let container: Container = {
        let container = Container()
        container.register(Animal.self, name: "dog") { _ in Dog(name: "Jack") }
        container.register(Animal.self, name: "turtle") { _ in Turtle(name: "R") }
        container.register(Person.self) { resolver in
            PetOwner(name: "Jeff", pet: resolver.resolve(Animal.self)!)
        }
        return container
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //透過resolver方法來取得服務實例
        let dog = container.resolve(Animal.self, name:"dog")!
        let turtle = container.resolve(Animal.self, name:"turtle")!
        
        print("[MutiSameServiceVC] Dog Name:", dog.name)
        print("[MutiSameServiceVC] Turtle Name:", turtle.name)
        
        let person = container.resolve(Person.self)!
        let petOwner = person as! PetOwner
        let pet = petOwner.pet
        
        print("[RegisterExampleVC] petOwner Name:", petOwner.name)
        print("[RegisterExampleVC] pet Name:", pet.name)
    }
    
}
