//
//  IdentifiedValue.swift
//  TypeSupport
//
//  Created by Casey Fleser on 2/22/23.
//

import Foundation

/// A type that provides ``IdentityTraits`` as well as an associated ``IdentifiableType`` `value`
///
/// An ``IdentifedValue`` must also  include the abilty to convert itself into ``AnyIdentified``.

protocol IdentifedValue: Codable {
    associatedtype Value: IdentifiableType
    
    var idTraits    : IdentityTraits { get }
    var asAny       : AnyIdentified { get }
    
    var value       : Value { get }
}
