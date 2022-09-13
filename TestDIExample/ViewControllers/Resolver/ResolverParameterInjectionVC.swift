//
//  ResolverParameterInjectionVC.swift
//  TestDIExample
//
//  Created by APP技術部-陳冠志 on 2022/9/12.
//

import UIKit
import Resolver

class ResolverParameterInjectionVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let smallHorse: Animal = Resolver.resolve(name:"small", args: "Spirit")
        let bigHorse: Animal = Resolver.resolve(name:"big" ,args: ["name_b":"Lucky", "running_b": true])
        
        print("[ResolverParameterInjectionVC] smallHorse Name:", smallHorse.name)
        print("[ResolverParameterInjectionVC] smallHorse running:", smallHorse.running)
    }
    
}

extension Resolver {
    public static func registerResolverParameterInjectionVC() {
        
        //註冊
        register() { (_, args) in
            Horse(name: args())
        }.implements(Animal.self, name: "small")
    
        register() { (_, args) in
            Horse(name: args("name_b") as String, running: args("running_b"))
        }.implements(Animal.self, name: "big")
    }
}


