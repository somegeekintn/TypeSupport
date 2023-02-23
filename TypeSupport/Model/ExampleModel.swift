//
//  ExampleModel.swift
//  TypeSupport
//
//  Created by Casey Fleser on 2/22/23.
//

import Foundation

struct ExampleModel: IdentifiableType {
    static var typeID   : AnyIdentified.TypeID { .example }

    let intVal          : Int
    let stringVal       : String
    let identified      : AnyIdentified
    let date            : Date
    
    func asIdentified(idTraits: IdentityTraits? = nil) -> AnyIdentified {
        .example(Identified(self, idTraits: idTraits))
    }
}
