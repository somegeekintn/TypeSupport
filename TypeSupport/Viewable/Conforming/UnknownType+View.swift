//
//  UnknownType+View.swift
//  TypeSupport
//
//  Created by Casey Fleser on 2/22/23.
//

import SwiftUI

extension UnknownType: ViewableType {
    var content: some View {
        VStack(alignment: .leading) {
            Text("Unknown Type")
            if let type = decodedType {
                Text("Decoded Type: \(type)")
            }
            if let keys = decodedKeys {
                Text("Decoded Keys: \(keys.joined(separator: ", "))")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct UnknownType_View_Previews: PreviewProvider {
    static var previews: some View {
        UnknownType().content
    }
}
