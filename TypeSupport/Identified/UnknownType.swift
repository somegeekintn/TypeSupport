//
//  UnknownType.swift
//  TypeSupport
//
//  Created by Casey Fleser on 2/22/23.
//

import Foundation

struct UnknownType: IdentifiableType {
    enum AssumedKeys: String, CodingKey {
        case typeID = "type"
    }
    
    struct UnknownKeys: CodingKey {
        var stringValue : String
        var intValue    : Int?
        
        init(key: AssumedKeys)      { self.stringValue = key.stringValue }
        init?(stringValue: String)  { self.stringValue = stringValue }
        init?(intValue: Int)        { return nil }
    }

    static var typeID   : AnyIdentifiable.TypeID { .unknown }
    var asAny           : AnyIdentifiable { .unknown(self) }
    
    let decodedType     : String?
    let decodedKeys     : [String]?
    
    init() {
        self.decodedKeys = nil
        self.decodedType = nil
    }
    
    init(from decoder: Decoder) throws {
        let container   = try decoder.container(keyedBy: UnknownKeys.self)

        self.decodedKeys = container.allKeys.map({ $0.stringValue })
        self.decodedType = try container.decodeIfPresent(String.self, forKey: UnknownKeys(key: .typeID))
    }

    func encode(to encoder: Encoder) throws {
        // Unknown types encode nothing
    }
}
