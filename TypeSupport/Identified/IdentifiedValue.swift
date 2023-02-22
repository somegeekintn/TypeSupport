//
//  IdentifiedValue.swift
//  TypeSupport
//
//  Created by Casey Fleser on 2/22/23.
//

import Foundation

/// A  type whose `value` is an `IdentifiableType`
///
/// An IdentifedValue must also expose the `IdentityTraits` an include the abilty to
/// convert itself into `AnyIdentified`.
///
protocol IdentifedValue: Codable {
    associatedtype Value: IdentifiableType
    
    var idTraits    : IdentityTraits { get }
    var asAny       : AnyIdentified { get }
    
    var value       : Value { get }
}
