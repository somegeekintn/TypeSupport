//
//  AnyIdentifiable+View.swift
//  TypeSupport
//
//  Created by Casey Fleser on 3/10/23.
//

import SwiftUI

extension AnyIdentifiable: ViewableType {
    var content: some View {
        switch self {
            case .unknown(let value):   AnyViewable(value)

            case .date(let value):      AnyViewable(value)
            case .double(let value):    AnyViewable(value)
            case .example(let value):   AnyViewable(value)
            case .int(let value):       PropertyView(value)
            case .string(let value):    PropertyView(value)
        }
    }
}

struct AnyIdentifiable_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            AnyViewable(42)
            AnyViewable(Date())
        }
    }
}
