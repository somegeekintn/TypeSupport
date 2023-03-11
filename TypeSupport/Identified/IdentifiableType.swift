//
//  IdentifiableType.swift
//  TypeSupport
//
//  Created by Casey Fleser on 2/22/23.
//

import Foundation

/// A type that provides an identifier used to identify itself as well as
/// the ability to express itself as an ``AnyIdentifiable``

protocol IdentifiableType: Codable {
    var typeID          : AnyIdentifiable.TypeID { get }
    var children        : [Identified<AnyIdentifiable>]? { get }
    var asAny           : AnyIdentifiable { get }
    
    static var typeID   : AnyIdentifiable.TypeID { get }
}

extension IdentifiableType {
    var typeID          : AnyIdentifiable.TypeID { Self.typeID }
    var children        : [Identified<AnyIdentifiable>]? { nil }
}

enum IdentityError: Error {
    case typeMistach(expected: AnyIdentifiable.TypeID, found: AnyIdentifiable.TypeID)
}

