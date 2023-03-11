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
    @State var items    : [Identified<AnyIdentifiable>] = []
    @State var viewID   = UUID().uuidString

    let exampleValue    = ExampleModel(intVal: 27, stringVal: "demo type", date: Date(), items: [Identified(56.7)])
    var exampleSequence : [Identified<AnyIdentifiable>] {
        ([42, "hello", 0.1, exampleValue] as [IdentifiableType]).map { Identified($0) }
    }

    var body: some View {
        VStack(spacing: 0) {
            NavigationView {
                VStack(alignment: .leading) {
                    FilteredNodeView() { items }
                        .frame(minWidth: 200)
                        .id(viewID) // annoying. if AnyIdentified were hashable would that work?
                }
            }
            
            Divider()
            
            VStack(alignment: .leading) {
                Text("JSON:")
                Text(String(describing: exampleSequence.asJSON))
                    .font(.system(size: 10, design: .monospaced))
                    .textSelection(.enabled)
            }
            .padding()
        }
        .onAppear(perform: decodeExample)
        
    }

    func decodeExample() {
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
              "items": [
                { "type": "double", "id": "exdbl_id", "value": 56.7 },
                { "type": "string", "id": "exstr_id", "value": "foo" },
                { "type": "crap", "id": "excrp_id", "value": "foo" }
              ],
              "intVal": 27,
              "date": "2023-02-22T13:33:42Z"
            }
          }
        ]
        """

        guard let jsonData  = exampleJSON.data(using: .utf8) else { return  }
        let jsonDecoder     = JSONDecoder()
        
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        do {
            items = try jsonDecoder.decode([Identified<AnyIdentifiable>].self, from: jsonData)
            resetView()
        }
        catch {
            print("Failed to decode items: \(error)")
        }
    }
    
    func resetView() {
        viewID = UUID().uuidString
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
}
