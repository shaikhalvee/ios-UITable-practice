//
//  User.swift
//  Assignment05
//
//  Created by Mohamed Shehab on 2/11/24.
//

import Foundation

class User {
    var name: String
    var email: String
    var gender: String
    var age: Int
    var state: String
    var group: String
    
    init(name: String? = nil, email: String? = nil, gender: String? = nil, age: Int? = nil, state: String? = nil, group: String? = nil) {
        self.name = name ?? ""
        self.email = email ?? ""
        self.gender = gender ?? ""
        self.age = age ?? 0
        self.state = state ?? ""
        self.group = group ?? ""
    }
}
