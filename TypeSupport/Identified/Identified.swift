//
//  Identified.swift
//  TypeSupport
//
//  Created by Casey Fleser on 2/22/23.
//

import Foundation

/// A generic template for any ``IdentifiableType``

struct Identified<T: IdentifiableType>: IdentifedValue {
    enum CodingKeys: String, CodingKey {
        case value  // = "content"
    }
    
    let idTraits        : IdentityTraits
    let value           : T
    var asIdentified    : AnyIdentified { value.asIdentified(idTraits: idTraits) }
    
    init(_ value: T, idTraits: IdentityTraits? = nil) {
        self.idTraits = idTraits ?? IdentityTraits(typeID: T.typeID)
        self.value = value
    }

    init(from decoder: Decoder) throws {
        let container   = try decoder.container(keyedBy: CodingKeys.self)
        let idTraits    = try IdentityTraits(from: decoder)
        
        if idTraits.typeID != T.typeID {
            throw IdentityError.typeMistach(expected: T.typeID, found: idTraits.typeID)
        }
        else {
            self.idTraits = idTraits
            
            if idTraits.typeID == .unknown {
                // Unknown is special. We give it a chance to record some of the details
                // about what was discovered while attempting to decode.
                self.value = try T(from: decoder)
            }
            else {
                self.value = try container.decode(T.self, forKey: .value)
            }
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

       try idTraits.encode(to: encoder)
       try container.encode(value, forKey: .value)
    }
}
