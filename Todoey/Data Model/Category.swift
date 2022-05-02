//
//  Category.swift
//  Todoey
//
//  Created by Gianluca Po on 12/12/2017.
//  Copyright © 2017 Gianluca Po. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var colour: String = ""
    let items = List<Item>()
}
