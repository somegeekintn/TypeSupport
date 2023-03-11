//
//  Int+View.swift
//  TypeSupport
//
//  Created by Casey Fleser on 2/22/23.
//

import SwiftUI

extension Int: ViewableType {
    var content: some View {
//        PropertyView(self, named: "self") {
            Text("\(self)")
//        }
    }
}

struct Int_View_Previews: PreviewProvider {
    static var previews: some View {
        42.content
    }
}
