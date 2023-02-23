//
//  IdentifiableType.swift
//  TypeSupport
//
//  Created by Casey Fleser on 2/22/23.
//

import Foundation

/// A type that provides an identifier used to identify itself as well as
/// the ability to express itself as an ``AnyIdentified``

protocol IdentifiableType: Codable {
    static var typeID   : AnyIdentified.TypeID { get }
    
    func asAny(idTraits: IdentityTraits?) -> AnyIdentified
}

extension IdentifiableType {
    var asAny   : AnyIdentified { return asAny(idTraits: nil) }
}

enum IdentityError: Error {
    case typeMistach(expected: AnyIdentified.TypeID, found: AnyIdentified.TypeID)
}
