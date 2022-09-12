//
//  ResolverParameterInjectionVC.swift
//  TestDIExample
//
//  Created by APP技術部-陳冠志 on 2022/9/12.
//

import UIKit
import Resolver

class ResolverParameterInjectionVC: UIViewController, Resolving {

    override func viewDidLoad() {
        super.viewDidLoad()

        let smallHorse: Animal = Resolver.resolve(args: "Spirit")
        let bigHorse: Animal = Resolver.resolve(args: ["name": "Lucky", "running": true])
    }
    
}

extension Resolver {
    public static func registerResolverParameterInjectionVC() {
        
        //註冊
        register { (_, args) in
            Horse(name: args())
        }.implements(Animal.self)
    
        register { (_, args) in
            Horse(name: args("name"), running: args("running"))
        }.implements(Animal.self)
    }
}


