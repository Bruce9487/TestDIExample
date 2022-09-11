//
//  InjectionVC.swift
//  TestDIExample
//
//  Created by Bruce Chen on 2022/9/11.
//

import UIKit
import Swinject

class InjectionVC: UIViewController {
    
    let container: Container = {
        let container = Container()
        container.register(Animal.self) { _ in Dog(name: "Jack") }
        
        //初始化注入
        container.register(Person.self) { r in
            PetOwner(name: "Jeff", pet: r.resolve(Animal.self)!)
        }
        
        //屬性注入
        container.register(NewPerson.self) { r in
            let owner = PetOwner2()
            owner.pet = r.resolve(Animal.self)
            return owner
        }
        
        container.register(NewPerson.self) { _ in PetOwner2() }
            .initCompleted { r, p in
                let owner = p as! PetOwner2
                owner.pet = r.resolve(Animal.self)
            }
        
        
        //方法注入
        container.register(NewPerson.self) { r in
            let owner = PetOwner3()
            owner.setPet(pet: r.resolve(Animal.self)!)
            return owner
        }
        
        container.register(NewPerson.self) { _ in PetOwner3() }
            .initCompleted { r, p in
                let owner = p as! PetOwner3
                owner.setPet(pet: r.resolve(Animal.self)!)
            }
        
        return container
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
