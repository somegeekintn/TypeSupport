//
//  AnyViewable.swift
//  TypeSupport
//
//  Created by Casey Fleser on 3/11/23.
//

import SwiftUI

struct AnyViewable<T: ViewableType>: View {
    let viewable    : T
    
    init(_ viewable: T) {
        self.viewable = viewable
    }
    
    init<X>(_ nonViewable: X) where T == NonViewable {
        self.viewable = NonViewable()
    }
    
    var body: some View {
        viewable.content
    }
}

struct NonViewable: ViewableType {
    var content: some View {
        Text("This type isn't viewable")
            .frame(maxWidth: .infinity)
    }
}

struct AnyViewable_Previews: PreviewProvider {
    static var previews: some View {
        AnyViewable(42)
    }
}
