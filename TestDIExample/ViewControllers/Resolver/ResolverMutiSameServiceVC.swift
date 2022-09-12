//
//  ResolverMutiSameServiceVC.swift
//  TestDIExample
//
//  Created by APP技術部-陳冠志 on 2022/9/12.
//

import UIKit
import Resolver

class ResolverMutiSameServiceVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //透過resolver方法來取得服務實例
        let dog = Resolver.resolve(Animal.self, name: "dog")
        let turtle = Resolver.resolve(Animal.self, name: "turtle")
        
        print("[ResolverMutiSameServiceVC] Dog Name:", dog.name)
        print("[ResolverMutiSameServiceVC] Turtle Name:", turtle.name)
        
        let person: Person = Resolver.resolve()
        let petOwner = person as! PetOwner
        let pet = petOwner.pet
        
        print("[ResolverMutiSameServiceVC] petOwner Name:", petOwner.name)
        print("[ResolverMutiSameServiceVC] pet Name:", pet.name)
    }
}

extension Resolver {
    public static func registerResolverMutiSameServiceVC() {
        //註冊
        register { Dog(name: "Jack") }.implements(Animal.self, name: "dog")
        register { Turtle(name: "R") }.implements(Animal.self, name: "turtle")
        register { PetOwner(name: "Jeff", pet: resolve(name: "turtle")) }.implements(Person.self)
    }
}
