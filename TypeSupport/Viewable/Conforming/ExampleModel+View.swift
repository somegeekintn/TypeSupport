//
//  ExampleModel+View.swift
//  TypeSupport
//
//  Created by Casey Fleser on 2/22/23.
//

import SwiftUI

extension ExampleModel: ViewableType {
    var content: some View {
        VStack(alignment: .leading) {
            intVal.content
            stringVal.content
            identified.content
            date.asIdentified.content
        }
    }
}

struct ExampleModel_View_Previews: PreviewProvider {
    static var previews: some View {
        let exampleValue = ExampleModel(intVal: 27, stringVal: "demo type", identified: Identified(56.7).asIdentified, date: Date())
        
        exampleValue.content
    }
}
