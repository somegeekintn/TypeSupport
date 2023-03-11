//
//  Int+ID.swift
//  TypeSupport
//
//  Created by Casey Fleser on 2/22/23.
//

import Foundation

extension Int: IdentifiableType {
    static var typeID   : AnyIdentifiable.TypeID { .int }
    var asAny           : AnyIdentifiable { .int(self) }
}
