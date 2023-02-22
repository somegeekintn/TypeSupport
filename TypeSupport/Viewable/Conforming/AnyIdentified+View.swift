//
//  AnyIdentified+View.swift
//  TypeSupport
//
//  Created by Casey Fleser on 2/22/23.
//

import SwiftUI

extension AnyIdentified: ViewableType {
    var content: some View {
        switch self {
            case .any(let ref):     IdentifiedView(ref)
            case .unknown(let ref): IdentifiedView(ref)

            case .date(let ref):    IdentifiedView(ref)
            case .double(let ref):  IdentifiedView(ref)
            case .example(let ref): IdentifiedView(ref)
            case .int(let ref):     IdentifiedView(ref)
            case .string(let ref):  IdentifiedView(ref)
        }
    }
}

struct AnyIdentified_View_Previews: PreviewProvider {
    static var previews: some View {
        42.asAny.content
    }
}
