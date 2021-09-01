//
//  Category.swift
//  ToDooo
//
//  Created by SEAN BLAKE on 8/28/21.
//

import Foundation
import RealmSwift

class Category : Object {
    @objc dynamic var name : String = ""
    let items = List<Item>()
}
