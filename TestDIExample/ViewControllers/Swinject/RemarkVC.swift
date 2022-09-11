//
//  RemarkVC.swift
//  TestDIExample
//
//  Created by Bruce Chen on 2022/9/11.
//

import UIKit
import Swinject

class RemarkVC: UIViewController {

    //註冊
    let container: Container = {
        let container = Container()
        // The Registration Key is (Animal, (String) -> Animal)
        container.register(Animal.self) { _, name in Dog(name: name) }
        return container
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //從容器解析實例時，必須將類型推斷和註冊時的類型相同。
        let name1: String = "Jerry"
        let jerry1 = container.resolve(Animal.self, argument: name1)
        print("[RemarkVC] jerry1 Name:", jerry1?.name)
        
        let name2: NSString = "Jerry"
        let jerry2 = container.resolve(Animal.self, argument: name2)
        print("[RemarkVC] jerry2 Name:", jerry2?.name)

        let name3: String? = "Jerry"
        let jerry3 = container.resolve(Animal.self, argument: name3)
        print("[RemarkVC] jerry3 Name:", jerry3?.name)

        let name4: String! = "Jerry"
        let jerry4 = container.resolve(Animal.self, argument: name4) 
        print("[RemarkVC] jerry4 Name:", jerry4?.name)
    }
    
}
