//
//  PetOwner3.swift
//  TestDIExample
//
//  Created by Bruce Chen on 2022/9/12.
//

import Foundation

class PetOwner3: NewPerson {
    
    var pet: Animal?

    init() { }

    func setPet(pet: Animal) {
        self.pet = pet
    }
}
