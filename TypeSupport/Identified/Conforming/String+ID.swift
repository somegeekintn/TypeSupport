//
//  String+ID.swift
//  TypeSupport
//
//  Created by Casey Fleser on 2/22/23.
//

import Foundation

extension String: IdentifiableType {
    static var typeID   : AnyIdentified.TypeID { .string }

    func asAny(idTraits: IdentityTraits? = nil) -> AnyIdentified {
        .string(Identified(self, idTraits: idTraits))
    }
}
