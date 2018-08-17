//
//  Models.swift
//  JsonTableView
//
//  Created by Sergey on 16.08.2018.
//  Copyright © 2018 Sergey. All rights reserved.
//

import Foundation

struct Actors: Codable {
    let actors: [Actor]
}

struct Actor: Codable {
    let name: String
    let description: String
    let dob: String
    let country: String
    let height: String
    let spouse: String
    let children: String
    let image: String
}
