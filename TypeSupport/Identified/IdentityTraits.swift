//
//  IdentityTraits.swift
//  TypeSupport
//
//  Created by Casey Fleser on 2/22/23.
//

import Foundation

/// Traits common to each ``IdentifiableType``
///
/// A `typeID` is a requirement but additional properties can be added / subtracted depending
/// on encoding format or other properties. Examples include:
/// - A `Date` which could be used to determine if a value is outdated
/// - A `URL` for a type which could reference the actual value
/// Its up to a `IdentifedValue` what sort of IdentityTraits are neeed.
///
/// Whether or not it would be better to have an `IdentityingTraits` protocol making the `typeID`
/// contract more explicit is debatable.
///
struct IdentityTraits: Codable {
    enum CodingKeys: String, CodingKey {
        case typeID = "type"
        case valueID = "id"
    }

    let typeID          : AnyIdentified.TypeID
    let valueID         : String
    
    init(typeID: AnyIdentified.TypeID, valueID: String? = nil) {
        self.typeID = typeID
        self.valueID = valueID ?? UUID().uuidString
    }
    
    init(from decoder: Decoder) throws {
        let container   = try decoder.container(keyedBy: CodingKeys.self)
        
        self.typeID = (try? container.decode(AnyIdentified.TypeID.self, forKey: .typeID)) ?? AnyIdentified.TypeID.unknown
        self.valueID = try container.decode(String.self, forKey: .valueID)
    }
}

