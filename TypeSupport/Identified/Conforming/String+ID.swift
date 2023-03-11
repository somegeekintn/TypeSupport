//
//  String+ID.swift
//  TypeSupport
//
//  Created by Casey Fleser on 2/22/23.
//

import Foundation

extension String: IdentifiableType {
    static var typeID   : AnyIdentifiable.TypeID { .string }
    var asAny           : AnyIdentifiable { .string(self) }
}
