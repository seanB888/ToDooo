//
//  Item.swift
//  ToDooo
//
//  Created by SEAN BLAKE on 8/28/21.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title : String = ""
    @objc dynamic var done : Bool = false
    var parentCategory = LinkingObjects(fromType: Category.self, property: "Items")
}
