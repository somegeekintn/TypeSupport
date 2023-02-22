//
//  DemoView.swift
//  TypeSupport
//
//  Created by Casey Fleser on 2/22/23.
//

import SwiftUI

extension Encodable {
    var asJSON: String {
        let jsonEncoder = JSONEncoder()
        
        jsonEncoder.dateEncodingStrategy = .iso8601
        do {
            let encoded = try jsonEncoder.encode(self)
            
            return String(data: encoded, encoding: .utf8) ?? "Unable to encode JSON data as UTF-8"
        }
        catch {
            return "Unable to encode \(type(of: self))"
        }
    }
}

struct DemoView: View {
    let exampleValue    = ExampleModel(intVal: 27, stringVal: "demo type", identified: Identified(56.7).asAny, date: Date())
    var exampleSequence : [AnyIdentified] {
        ([42, "hello", 0.1, exampleValue] as [IdentifiableType]).map({ $0.asAny })
    }
    
    var body: some View {
        VStack {
            Text("TypeSupport Demo").font(.system(.title))
            Divider()

            VStack(alignment: .leading) {
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(exampleSequence, id: \.typedValue.idTraits.valueID) { item in
                            item.content
                        }
                    }
                }
                
                Divider()
                Text("JSON:")
                Text(String(describing: exampleSequence.asJSON))
                    .font(.system(size: 10, design: .monospaced))
            }
        }
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
}
