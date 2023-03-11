//
//  Identified+Node.swift
//  TypeSupport
//
//  Created by Casey Fleser on 3/10/23.
//

import SwiftUI

extension Identified: Node, Identifiable {
    var title       : String { "\(value.typeID.identifiableType) - \(idTraits.typeID.rawValue)" }
    var items       : [Identified<AnyIdentifiable>]? { value.children }
    var id          : String { idTraits.valueID }
    
    var icon        : some View { Image(systemName: "cube") }
    var content     : some View {
        VStack {
            value.asAny.content
                .titledContent(nil)
            Spacer()
        }
        .padding()
    }
}

extension AnyIdentifiable.TypeID {
    var identifiableType  : any IdentifiableType.Type {
        switch self {
            case .unknown:  return UnknownType.self

            case .date:     return Date.self
            case .double:   return Double.self
            case .example:  return ExampleModel.self
            case .int:      return Int.self
            case .string:   return String.self
        }
    }
}

struct Identified_Node_Previews: PreviewProvider {
    static var previews: some View {
        NodeLabel(FilteredNode(Identified(42)))
    }
}
