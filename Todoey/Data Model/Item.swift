//
//  Item.swift
//  Todoey
//
//  Created by Gianluca Po on 12/12/2017.
//  Copyright © 2017 Gianluca Po. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
