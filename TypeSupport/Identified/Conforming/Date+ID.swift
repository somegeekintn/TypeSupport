//
//  Date+ID.swift
//  TypeSupport
//
//  Created by Casey Fleser on 2/22/23.
//

import Foundation

extension Date: IdentifiableType {
    static var typeID   : AnyIdentified.TypeID { .date }

    func asAny(idTraits: IdentityTraits? = nil) -> AnyIdentified {
        .date(Identified(self, idTraits: idTraits))
    }
}
