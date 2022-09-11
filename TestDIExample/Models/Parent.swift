//
//  Parent.swift
//  TestDIExample
//
//  Created by Bruce Chen on 2022/9/12.
//

import Foundation

class Parent: Person {
    
    let name: String
    let child: PetOwner
    let pet: Animal

    init(name: String, child: PetOwner, pet: Animal) {
        self.name = name
        self.child = child
        self.pet = pet
    }
}
