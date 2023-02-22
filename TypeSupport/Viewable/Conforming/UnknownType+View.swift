//
//  UnknownType+View.swift
//  TypeSupport
//
//  Created by Casey Fleser on 2/22/23.
//

import SwiftUI

extension UnknownType: ViewableType {
    var content: some View {
        Text("Unknown Type")
    }
}

struct UnknownType_View_Previews: PreviewProvider {
    static var previews: some View {
        UnknownType().content
    }
}
