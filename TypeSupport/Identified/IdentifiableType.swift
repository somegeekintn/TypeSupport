//
//  IdentifiableType.swift
//  TypeSupport
//
//  Created by Casey Fleser on 2/22/23.
//

import Foundation

/// Describes the conformance requirements of a type that makes itself identifiable

protocol IdentifiableType: Codable {
    static var typeID   : AnyIdentified.TypeID { get }
    
    func asAny(idTraits: IdentityTraits?) -> AnyIdentified
}

extension IdentifiableType {
    var asAny   : AnyIdentified { return asAny(idTraits: nil) }
}

/// Traits common to each `IdentifiableType`
///
/// An IdentifyingTraits protocol with a required typeID could be used to make IdentityTraits more generic
/// and adaptable to other encoding styles

struct IdentityTraits: Codable {
    enum CodingKeys: String, CodingKey {
        case typeID = "type"
        case valueID = "id"
    }

    var typeID          : AnyIdentified.TypeID
    var valueID         : String
    
    init(typeID: AnyIdentified.TypeID, valueID: String? = nil) {
        self.typeID = typeID
        self.valueID = valueID ?? UUID().uuidString
    }
}
