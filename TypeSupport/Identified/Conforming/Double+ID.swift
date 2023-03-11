//
//  Double+ID.swift
//  TypeSupport
//
//  Created by Casey Fleser on 2/22/23.
//

import Foundation

extension Double: IdentifiableType {
    static var typeID   : AnyIdentifiable.TypeID { .double }
    var asAny           : AnyIdentifiable { .double(self) }
}
