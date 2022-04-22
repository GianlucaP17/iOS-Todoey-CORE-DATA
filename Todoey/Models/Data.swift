//
//  Data.swift
//  Todoey
//
//  Created by gianluca posca on 14/06/21.
//  Copyright © 2021 https://gianlucap17.github.io/. All rights reserved.
//

import Foundation
import RealmSwift

class Data: Object { // classe di realm per dare ai modelli un oggetto
    // dynamic = dice di monitorarla sempre, viene da obj-c
    @objc dynamic var name : String = ""
    @objc dynamic var age : Int = 0
    
}
