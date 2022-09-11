//
//  ScopeVC.swift
//  TestDIExample
//
//  Created by Bruce Chen on 2022/9/11.
//

import UIKit
import Swinject

class ScopeVC: UIViewController {

    //註冊
    let container: Container = {
        let container = Container()
        container.register(Animal.self, name: "dog") { _ in Dog(name: "Jack") }.inObjectScope(.graph)
        container.register(Animal.self, name: "turtle") { _ in Turtle(name: "R") }.inObjectScope(.graph)
        
        container.register(Person.self, name: "parent") { r in
            Parent(name: "Peter", child: r.resolve(Person.self, name:"child")! as! PetOwner, pet: r.resolve(Animal.self, name:"dog")!)
        }.inObjectScope(.graph)
        
        container.register(Person.self, name: "child") { r in
            PetOwner(name: "Jeff", pet: r.resolve(Animal.self, name:"dog")!)
        }.inObjectScope(.graph)
        
        return container
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Graph (Default)
        let parent = container.resolve(Person.self, name: "parent")!
        let pet1 = (parent as! Parent).pet
        let pet2 = (parent as! Parent).child.pet
        
        print("[ScopeVC] parent:", parent)
        print("[ScopeVC] pet1:", pet1)
        print("[ScopeVC] pet2:", pet2)
    }
    
}
