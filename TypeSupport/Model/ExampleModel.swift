//
//  ExampleModel.swift
//  TypeSupport
//
//  Created by Casey Fleser on 2/22/23.
//

import Foundation

struct ExampleModel: IdentifiableType {
    static var typeID   : AnyIdentifiable.TypeID { .example }

    let intVal          : Int
    let stringVal       : String
    let date            : Date
    var items           : [Identified<AnyIdentifiable>]

    var children        : [Identified<AnyIdentifiable>]? { items }
    var asAny           : AnyIdentifiable { .example(self) }
}
