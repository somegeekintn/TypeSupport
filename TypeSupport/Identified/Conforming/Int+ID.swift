//
//  Int+ID.swift
//  TypeSupport
//
//  Created by Casey Fleser on 2/22/23.
//

import Foundation

extension Int: IdentifiableType {
    static var typeID   : AnyIdentified.TypeID { .int }

    func asIdentified(idTraits: IdentityTraits? = nil) -> AnyIdentified {
        .int(Identified(self, idTraits: idTraits))
    }
}
