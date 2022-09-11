//
//  PetOwner.swift
//  TestDIExample
//
//  Created by Bruce Chen on 2022/9/11.
//

import Foundation

class PetOwner: Person {
    let name: String
    let pet: Animal

    init(name: String, pet: Animal) {
        self.name = name
        self.pet = pet
    }
}
