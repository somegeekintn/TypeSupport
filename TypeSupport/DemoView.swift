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
    let exampleJSON    = """
    [
      { "type": "int", "id": "int_id", "value": 42 },
      { "type": "string", "id": "str_id", "value": "hello" },
      { "type": "double", "id": "dbl_id", "value": 0.1 },
      { "type": "date", "id": "date_id", "value": "2023-02-22T13:33:42Z" },
      {
        "type": "example",
        "id": "ex_id",
        "value": {
          "stringVal": "demo type",
          "identified": { "type": "double", "id": "exdbl_id", "value": 56.7 },
          "intVal": 27,
          "date": "2023-02-22T13:33:42Z"
        }
      }
    ]
    """
    let exampleValue    = ExampleModel(intVal: 27, stringVal: "demo type", identified: Identified(56.7).asIdentified, date: Date())
    var exampleSequence : [AnyIdentified] {
        ([42, "hello", 0.1, exampleValue] as [IdentifiableType]).map({ $0.asIdentified })
    }
    var decodedExample  : [AnyIdentified] {
        guard let jsonData  = exampleJSON.data(using: .utf8) else { return [] }
        let jsonDecoder     = JSONDecoder()
        
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        return (try? jsonDecoder.decode([AnyIdentified].self, from: jsonData)) ?? []
    }
    
    var body: some View {
        VStack {
            Text("TypeSupport Demo").font(.system(.title))
            Divider()
            
            VStack(alignment: .leading) {
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(decodedExample, id: \.typedValue.idTraits.valueID) { item in
                            item.content
                        }
                    }
                }
                
                Divider()
                Text("JSON:")
                Text(String(describing: exampleSequence.asJSON))
                    .font(.system(size: 10, design: .monospaced))
                    .textSelection(.enabled)
            }
        }
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
}
