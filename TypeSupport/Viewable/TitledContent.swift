//
//  TitledContent.swift
//  TypeSupport
//
//  Created by Casey Fleser on 3/11/23.
//

import SwiftUI

struct TitledContent: ViewModifier {
    let title   : String?
    
    init(_ title: String?) {
        self.title = title
    }
    
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 24, leading: 8, bottom: 8, trailing: 8))
            .background {
                VStack(spacing: 0) {
                    Text(title ?? " ")
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                    Color.black
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 6).strokeBorder(.blue)
                }
                .cornerRadius(6)
            }
    }
}

extension View {
    func titledContent(_ title: String?) -> some View {
        modifier(TitledContent(title))
    }
}

struct TitledContent_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Content to title")
        }
        .padding()
        .titledContent("Title goes here")
    }
}
