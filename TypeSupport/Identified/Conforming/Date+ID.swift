//
//  Date+ID.swift
//  TypeSupport
//
//  Created by Casey Fleser on 2/22/23.
//

import Foundation

extension Date: IdentifiableType {
    static var typeID   : AnyIdentifiable.TypeID { .date }
    var asAny           : AnyIdentifiable { .date(self) }
}
