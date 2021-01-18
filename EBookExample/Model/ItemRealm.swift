//
//  ItemRealm.swift
//  EBookExample
//
//  Created by ChangTingWei on 2021/1/13.
//

import Foundation
import RealmSwift

class ItemRealm: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done:Bool = false
    @objc dynamic var dateCreated: Date?
    
    var parentCategory = LinkingObjects(fromType: CategoryRealm.self, property: "itemRealms")
}

