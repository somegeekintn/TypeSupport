//
//  Double+ID.swift
//  TypeSupport
//
//  Created by Casey Fleser on 2/22/23.
//

import Foundation

extension Double: IdentifiableType {
    static var typeID   : AnyIdentified.TypeID { .double }

    func asAny(idTraits: IdentityTraits? = nil) -> AnyIdentified {
        .double(Identified(self, idTraits: idTraits))
    }
}
