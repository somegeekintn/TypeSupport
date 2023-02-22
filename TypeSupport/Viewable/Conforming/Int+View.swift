//
//  Int+View.swift
//  TypeSupport
//
//  Created by Casey Fleser on 2/22/23.
//

import SwiftUI

extension Int: ViewableType {
    var content: some View {
        Text("Int: \(self)")
    }
}

struct Int_View_Previews: PreviewProvider {
    static var previews: some View {
        42.content
    }
}
