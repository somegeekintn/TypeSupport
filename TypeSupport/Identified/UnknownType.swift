//
//  UnknownType.swift
//  TypeSupport
//
//  Created by Casey Fleser on 2/22/23.
//

import Foundation

struct UnknownType: IdentifiableType {
    static var typeID   : AnyIdentified.TypeID { .unknown }
    
    func asAny(idTraits: IdentityTraits? = nil) -> AnyIdentified {
        .unknown(Identified(self, idTraits: idTraits))
    }
}

