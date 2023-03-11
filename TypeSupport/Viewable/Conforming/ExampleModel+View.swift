//
//  ExampleModel+View.swift
//  TypeSupport
//
//  Created by Casey Fleser on 2/22/23.
//

import SwiftUI

extension ExampleModel: ViewableType {
    var content: some View { 
        ExampleModelView(model: self)
    }
}

struct ExampleModelView: View {
    let model   : ExampleModel
    
    var body: some View {
        VStack(alignment: .leading) {
            PropertyView(model.intVal, named: "intVal")
            PropertyView(model.stringVal, named: "stringVal")
            if !model.items.isEmpty {
                VStack {
                    ForEach(model.items) { item in
                        item.value.content
                            .titledContent("Item")
                    }
                }
            }
        }
    }
}

struct ExampleModel_View_Previews: PreviewProvider {
    static var previews: some View {
        let exampleValue = ExampleModel(intVal: 27, stringVal: "demo type", date: Date(), items: [Identified(56.7)])
        
        exampleValue.content
    }
}
