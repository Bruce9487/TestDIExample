//
//  ParametersInjectionVC.swift
//  TestDIExample
//
//  Created by Bruce Chen on 2022/9/11.
//

import UIKit
import Swinject

class ParametersInjectionVC: UIViewController {

    //註冊
    let container: Container = {
        let container = Container()
        container.register(Animal.self) { _, name in
            Horse(name: name)
        }
        container.register(Animal.self) { _, name, running in
            Horse(name: name, running: running)
        }
        return container
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //傳遞一個參數用：resolve(_:argument:)
        //傳遞兩個參數以上用：resolve(_:arguments:,_:)
        let smallHorse = container.resolve(Animal.self, argument: "Spirit")!
        let bigHorse = container.resolve(Animal.self, arguments: "Lucky", true)!
        
        print("[ParametersInjectionVC] smallHorse Name:", smallHorse.name)
        print("[ParametersInjectionVC] smallHorse running:", smallHorse.running!.description)
        
        print("[ParametersInjectionVC] bigHorse Name:", bigHorse.name)
        print("[ParametersInjectionVC] bigHorse running:", bigHorse.running!.description)
    }
    
}
