//
//  String+View.swift
//  TypeSupport
//
//  Created by Casey Fleser on 2/22/23.
//

import SwiftUI

extension String: ViewableType {
    var content: some View {
        Text("\(self)")
    }
}

struct String_View_Previews: PreviewProvider {
    static var previews: some View {
        "hello world".content
    }
}
