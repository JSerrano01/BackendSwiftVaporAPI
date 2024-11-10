//
//  File.swift
//  BackendSwiftVapor
//
//  Created by Jaime Serrano on 10/11/24.
//

import Foundation
import Vapor

struct User: Content {
    var id:Int
    var name: String
    var age: Int
    var email:String
}
