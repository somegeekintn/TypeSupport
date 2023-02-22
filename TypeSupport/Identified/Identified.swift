//
//  Identified.swift
//  TypeSupport
//
//  Created by Casey Fleser on 2/22/23.
//

import Foundation

/// A generic templace for any `IdentifiableType`

struct Identified<T: IdentifiableType>: IdentifedValue {
    enum CodingKeys: String, CodingKey {
        case value  // = "content"
    }
    
    let idTraits        : IdentityTraits
    let value           : T
    var asAny           : AnyIdentified { value.asAny(idTraits: idTraits) }
    
    init(_ value: T, idTraits: IdentityTraits? = nil) {
        self.idTraits = idTraits ?? IdentityTraits(typeID: T.typeID)
        self.value = value
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.idTraits = try IdentityTraits(from: decoder)
        self.value = try container.decode(T.self, forKey: .value)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

       try idTraits.encode(to: encoder)
       try container.encode(value, forKey: .value)
    }
}
