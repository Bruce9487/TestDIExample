//
//  ResolverRegitsterExampleVC.swift
//  TestDIExample
//
//  Created by APP技術部-陳冠志 on 2022/9/12.
//

import UIKit
import Resolver

class ResolverRegitsterExampleVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let person: Person = Resolver.resolve()
        let animal: Animal = Resolver.resolve()
        
        print("[ResolverRegitsterExampleVC] Animal Name:", animal.name)
        print("[ResolverRegitsterExampleVC] Person Name:", person.name)
        
        let petOwner = person as! PetOwner
        let pet = petOwner.pet
        
        print("[ResolverRegitsterExampleVC] petOwner Name:", petOwner.name)
        print("[ResolverRegitsterExampleVC] pet Name:", pet.name)
    }
    
}

extension Resolver {
    public static func registerResolverRegitsterExampleVC() {
        //註冊
        register { Dog(name: "Jack") }.implements(Animal.self)
        register { PetOwner(name: "Jeff", pet: resolve()) }.implements(Person.self)
    }
}
