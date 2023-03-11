//
//  PropertyView.swift
//  TypeSupport
//
//  Created by Casey Fleser on 3/11/23.
//

import SwiftUI

struct PropertyView<T: ViewableType>: View {
    let name    : String
    let value   : T
    
    init(_ value: T, named name: String = "self") {
        self.value = value
        self.name = name
    }
    
    var body: some View {
        HStack {
            Text(name)
            Text(String(describing: T.self))
            AnyViewable(value)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .overlay { RoundedRectangle(cornerRadius: 4).strokeBorder(.blue) }
    }
}


struct PropertyView_Previews: PreviewProvider {
    static var previews: some View {
        PropertyView(42)
    }
}
