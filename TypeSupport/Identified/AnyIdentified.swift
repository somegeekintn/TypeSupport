//
//  AnyIdentified.swift
//  TypeSupport
//
//  Created by Casey Fleser on 2/22/23.
//

import Foundation

/// `AnyIdentified` provides the abilty to express any ``IdentifiableType`` as a single type.
///
/// Each ``IdentifiableType`` must include a case in `AnyIdentified` with itself as an associated
/// value. It must also add its identifier to ``AnyIdentified/TypeID-swift.enum``

indirect enum AnyIdentified: IdentifiableType, Codable {
    enum TypeID: String, Codable {
        case any
        case unknown

        case date
        case double
        case example
        case int
        case string
        
        var identifiedType  : any IdentifedValue.Type {
            switch self {
            case .any:      return Identified<AnyIdentified>.self
            case .unknown:  return Identified<UnknownType>.self

            case .date:     return Identified<Date>.self
            case .double:   return Identified<Double>.self
            case .example:  return Identified<ExampleModel>.self
            case .int:      return Identified<Int>.self
            case .string:   return Identified<String>.self
            }
        }
    }

    case any(_ value: Identified<AnyIdentified>)
    case unknown(_ value: Identified<UnknownType>)

    case date(_ value: Identified<Date>)
    case double(_ value: Identified<Double>)
    case example(_ value: Identified<ExampleModel>)
    case int(_ value: Identified<Int>)
    case string(_ value: Identified<String>)

    static var typeID   : AnyIdentified.TypeID { .any }

    var typedValue      : any IdentifedValue {
        switch self {
            case .any(let value):       return value
            case .unknown(let value):   return value

            case .date(let value):      return value
            case .double(let value):    return value
            case .example(let value):   return value
            case .int(let value):       return value
            case .string(let value):    return value
        }
    }
    
    init(from decoder: Decoder) throws {
        // Note: this does result in redudant trait decoding so we could add
        // an initializer to IdentifiedType that would accept this decoded value
        // along with the Decoder
        let traits = try IdentityTraits(from: decoder)
        let result = try traits.typeID.identifiedType.init(from: decoder)
        
        self = result.asIdentified
    }

    func encode(to encoder: Encoder) throws {
        try typedValue.encode(to: encoder)
    }

    func asIdentified(idTraits: IdentityTraits? = nil) -> AnyIdentified {
        if idTraits != nil {
            print("Provided idTraits ignored when converting AnyIdentified to AnyIdentified")
        }
        
        return self
    }
}
