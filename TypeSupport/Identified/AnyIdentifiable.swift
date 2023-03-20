//
//  AnyIdentified.swift
//  TypeSupport
//
//  Created by Casey Fleser on 2/22/23.
//

import Foundation

/// `AnyIdentifiable` provides the abilty to express any ``IdentifiableType`` as a single type.
///
/// Each ``IdentifiableType`` must include a case in `AnyIdentified` with itself as an associated
/// value. It must also add its identifier to ``AnyIdentifiable.TypeID``


enum AnyIdentifiable: IdentifiableType, CustomStringConvertible {
    enum TypeID: String, Codable {
        case unknown

        case date
        case double
        case example
        case int
        case string
    }
    
    enum CodingKeys: String, CodingKey {
        case value  // = "content"
    }

    case unknown(_ value: UnknownType)

    case date(_ value: Date)
    case double(_ value: Double)
    case example(_ value: ExampleModel)
    case int(_ value: Int)
    case string(_ value: String)

    var asAny           : AnyIdentifiable { self }
    var typeID          : AnyIdentifiable.TypeID { value.typeID }
    var children        : [Identified<AnyIdentifiable>]? { value.children }
    static var typeID   : AnyIdentifiable.TypeID { .unknown }     // abstract

    var value        : any IdentifiableType {
        switch self {
            case .unknown(let value):   return value

            case .date(let value):      return value
            case .double(let value):    return value
            case .example(let value):   return value
            case .int(let value):       return value
            case .string(let value):    return value
        }
    }

    var description : String {
        switch self {
            case .unknown(let value):   return ".unknown(\(value))"

            case .date(let value):      return ".date(\(value)))"
            case .double(let value):    return ".doubl(\(value))"
            case .example(let value):   return ".exampl(\(value))"
            case .int(let value):       return ".int(\(value))"
            case .string(let value):    return ".string(\(value))"
        }
    }

    init(from decoder: Decoder) throws {
        let container   = try decoder.container(keyedBy: CodingKeys.self)
        let idTraits    = try IdentityTraits(from: decoder)

        switch idTraits.typeID {
            // Unknown is special. We give it a chance to record some of the details
            // about what was discovered while attempting to decode.
            case .unknown:  self = .unknown(try UnknownType(from: decoder))

            case .date:     self = .date(try container.decode(Date.self, forKey: .value))
            case .double:   self = .double(try container.decode(Double.self, forKey: .value))
            case .example:  self = .example(try container.decode(ExampleModel.self, forKey: .value))
            case .int:      self = .int(try container.decode(Int.self, forKey: .value))
            case .string:   self = .string(try container.decode(String.self, forKey: .value))
        }
    }
    
    func encode(to encoder: Encoder) throws {
        try value.encode(to: encoder)
    }
}
