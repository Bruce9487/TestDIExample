//
//  Animal.swift
//  TestDIExample
//
//  Created by Bruce Chen on 2022/9/11.
//

import Foundation

@objc protocol Animal {
    var name: String { get }
    @objc optional var running: Bool { get }
}
