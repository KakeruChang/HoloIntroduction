//
//  CategoryRealm.swift
//  EBookExample
//
//  Created by ChangTingWei on 2021/1/13.
//

import Foundation
import RealmSwift

class CategoryRealm: Object {
    @objc dynamic var name: String = ""
    let itemRealms = List<ItemRealm>()
}
