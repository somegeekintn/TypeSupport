//
//  IdentifiedView.swift
//  TypeSupport
//
//  Created by Casey Fleser on 2/22/23.
//

import SwiftUI

struct IdentifiedView<T: IdentifedValue>: View where T.Value: ViewableType {
    let identified      : T
    let isUnviewable    : Bool
    let typeDesc        : String
    
    init<X: IdentifedValue>(_ identified: X) where T == Identified<UnknownType> {
        self.identified = Identified(UnknownType(), idTraits: identified.idTraits)
        self.isUnviewable = true
        self.typeDesc = "\(type(of: identified.value))"
    }
    
    init(_ identified: T) {
        self.identified = identified
        self.isUnviewable = false
        self.typeDesc = "\(type(of: identified.value))"
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Type: \(typeDesc) /  \(identified.idTraits.typeID.rawValue)")
            Text("Value ID: \(identified.idTraits.valueID)")
            
            VStack(alignment: .leading) {
                if isUnviewable {
                    Text("\(typeDesc) does not conform to ViewableType")
                }
                identified.value.content
            }
            .padding(8)
            .overlay { RoundedRectangle(cornerRadius: 4).strokeBorder(.blue) }
            .padding(.leading, 16)
        }
    }
}

struct IdentifiedView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            IdentifiedView(Identified(42))
            IdentifiedView(Identified(Date()))
        }
    }
}
